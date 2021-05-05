import 'package:alatmusik/models/Bindings_Category.dart';
import 'package:alatmusik/models/Category.dart';
import 'package:alatmusik/services/constants/constants.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final String baseUrl;
  Dio dio;
  ApiProvider(this.baseUrl, Dio _dio) {
    dio = _dio ?? Dio();
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 10000
      ..options.receiveTimeout = 10000;
  }

  Future<List<Bindings>> getKategori() async {
    Response response = await dio.get(url_category);
    List<Bindings> bind = [];
    if (response.statusCode == 200) {
      for (var item in response.data["results"]["bindings"]) {
        Bindings bin = Bindings.fromJson(item);
        bind.add(bin);
      }
      return bind;
    } else {
      return null;
    }
  }

  // Future<List<Topik>> getTopik(String idKategori) async {
  //   Response response = await dio.get(url_topik + "/" + idKategori);
  //   List<Topik> topiks = [];

  //   if (response.statusCode == 200) {
  //     for (var item in response.data["ListTopik"]) {
  //       Topik topik = Topik.fromJson(item);
  //       topiks.add(topik);
  //     }
  //     return topiks;
  //   } else {
  //     return null;
  //   }
  // }

}
