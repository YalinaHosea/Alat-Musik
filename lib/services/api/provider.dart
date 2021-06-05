import 'dart:convert';
import 'package:alatmusik/models/Bind_Detail.dart';
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

  Future<Binding_DAM> getDetailAlatMusik(String nama_alatmusik) async {
    Response response =
        await dio.get(url_detailasm_1 + nama_alatmusik + url_detailasm_2);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // parse xml to json
      xml2json.parse(response.data);
      var jsondata = xml2json.toParker();
      var data = jsonDecode(jsondata);
      //  print('wkwkwk : ' + data['head']);
      Bind_Detail det = Bind_Detail.fromJson(data['sparql']);
      Bindings bin = det.results.bindings;
      Binding_DAM dam = new Binding_DAM(
          description: bin.description.value,
          name: bin.name.value,
          image: bin.image.value,
          video: bin.video.value,
          sumber: bin.sumber.value);
      return dam;
      // var item = data['sparql']['results']['results']['binding'];
      // Binding_DAM bind = new Binding_DAM(
      //     description: item['description']['value'] == null
      //         ? ""
      //         : item['description']['value'].toString(),
      //     name: item['name']['value'] == null
      //         ? ""
      //         : item['name']['value'].toString(),
      //     image: item['image']['value'] == null
      //         ? ""
      //         : item['image']['value'].toString(),
      //     video: item['video']['value'] == null
      //         ? ""
      //         : item['video']['value'].toString(),
      //     sumber: item['sumber']['value'] == null
      //         ? ""
      //         : item['sumber']['value'].toString());
      // return bind;
    }
    return null;
  }
}
