import 'dart:convert';
import 'package:alatmusik/models/Binding_AlatMusik.dart';
import 'package:alatmusik/models/Binding_DAM.dart';
import 'package:alatmusik/models/Bindings_Category.dart';
import 'package:alatmusik/services/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/painting.dart';
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

  Future<List<Bindings_AlatMusik>> getAlatMusik() async {
    Response response = await dio.get(url_alatmusik);
    List<Bindings_AlatMusik> bind = new List();
    if (response.statusCode == 200) {
      // parse xml to json
      xml2json.parse(response.data);
      var jsondata = xml2json.toGData();
      var data = json.decode(jsondata);

      // looping the parsed data and input to bind list
      for (var item in data['sparql']['results']['result']) {
        bind.add(Bindings_AlatMusik(
            name: item['binding'][1]['literal']['\$t'].toString(),
            image: item['binding'][2]['literal']['\$t'].toString()));
      }
      return bind;
    } else {
      return null;
    }
  }

  Future<List<Binding_DAM>> getDetailAlatMusik() async {
    Response response = await dio.get(url_detailasm);
    List<Binding_DAM> bind = new List();
    if (response.statusCode == 200) {
      // parse xml to json
      xml2json.parse(response.data);
      var jsondata = xml2json.toGData();
      var data = json.decode(jsondata);

      // looping the parsed data and input to bind list
      for (var item in data['sparql']['results']['result']) {
        bind.add(Binding_DAM(
            description: item['binding'][0]['literal']['\$t'].toString(),
            name: item['binding'][1]['literal']['\$t'].toString(),
            image: item['binding'][2]['literal']['\$t'].toString(),
            video: item['binding'][3]['literal']['\$t'].toString(),
            sumber: item['binding'][4]['literal']['\$t'].toString()));
      }
      return bind;
    } else {
      return null;
    }
  }
}
