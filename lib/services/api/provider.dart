import 'dart:convert';
import 'package:alatmusik/models/Binding_AlatMusik.dart';
import 'package:alatmusik/models/Binding_DAM.dart';
import 'package:alatmusik/models/Bindings_Category.dart';
import 'package:alatmusik/services/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:xml2json/xml2json.dart';

class ApiProvider {
  Xml2Json xml2json = new Xml2Json();
  final String baseUrl;
  Dio dio;
  ApiProvider(this.baseUrl, Dio _dio) {
    dio = _dio ?? Dio();
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 10000
      ..options.receiveTimeout = 10000;
  }

  Future<List<Bindings_Category>> getKategori() async {
    Response response = await dio.get(url_category);
    List<Bindings_Category> bind = new List();
    if (response.statusCode == 200) {
      // parse xml to json
      xml2json.parse(response.data);
      var jsondata = xml2json.toGData();
      var data = json.decode(jsondata);

      // looping the parsed data and input to bind list
      for (var item in data['sparql']['results']['result']) {
        bind.add(Bindings_Category(
            category: item['binding'][0]['literal']['\$t'].toString(),
            image: item['binding'][1]['literal']['\$t'].toString()));
      }
      return bind;
    } else {
      return null;
    }
  }

  Future<List<Bindings_AlatMusik>> getAlatMusik(String category) async {
    var url = url_alatmusik + category + url_alatmusik1;
    Response response = await dio.get(url);
    List<Bindings_AlatMusik> bind = new List();
    if (response.statusCode == 200) {
      // parse xml to json
      xml2json.parse(response.data);
      var jsondata = xml2json.toGData();
      var data = json.decode(jsondata);

      // looping the parsed data and input to bind list
      for (var item in data['sparql']['results']['result']) {
        bind.add(Bindings_AlatMusik(
            name: item['binding'][0]['literal']['\$t'].toString(),
            image: item['binding'][1]['literal']['\$t'].toString()));
      }
      return bind;
    } else {
      return null;
    }
  }

  Future<Binding_DAM> getDetailAlatMusik(String alatmusik) async {
    // var url = url_detailasm + alatmusik;
     var item = {"description": description, "name": name, "image", image, 
     "video": video, "sumber" : sumber}
    Response response = await dio.get(url_detailasm);
    if (response.statusCode == 200) {
      // parse xml to json
      xml2json.parse(response.data);
      var jsondata = xml2json.toGData();
      var data = json.decode(jsondata);
    }
    return item;
  }

}
