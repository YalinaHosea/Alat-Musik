import 'dart:convert';
import 'package:alatmusik/models/Bind_Detail.dart';
import 'package:alatmusik/models/Binding_AlatMusik.dart';
import 'package:alatmusik/models/Binding_DAM.dart';
import 'package:alatmusik/models/Bindings_Category.dart';
import 'package:alatmusik/models/Search_Result.dart';
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
    print("response 1 : " + response.statusCode.toString());
    Response response2 =
        await dio.get(url_detail_daerah1 + nama_alatmusik + url_detail_daerah2);
    print("response 2 : " + response2.statusCode.toString());
    Response response4 = await dio
        .get(url_detail_kegunaan1 + nama_alatmusik + url_detail_kegunaan2);
    // print(url_detail_kegunaan1);
    Response response3 =
        await dio.get(url_detail_bahan1 + nama_alatmusik + url_detail_bahan2);
    print(url_detail_bahan1);

    if (response.statusCode == 200 &&
        response2.statusCode == 200 &&
        response3.statusCode == 200 &&
        response4.statusCode == 200) {
      // parse xml to json
      xml2json.parse(response.data);
      var jsondata = xml2json.toParker();
      var data = jsonDecode(jsondata);
      print(data.toString());

      Bind_Detail det = Bind_Detail.fromJson(data['sparql']);
      Bindings bin = det.results.bindings;

      //daerah
      xml2json.parse(response2.data);
      var jsondata2 = xml2json.toParker();
      var data2 = jsonDecode(jsondata2);
      print("data 2 : " + data2.toString());
      String daerah = data2['sparql']['results']['result']['binding'][0]
              ['literal']
          .toString();

      //bahan
      xml2json.parse(response3.data);
      var jsondata3 = xml2json.toParker();
      var data3 = jsonDecode(jsondata3);
      print("data 3 : " + data3.toString());
      List<String> bahan = new List();
      var results = data3['sparql']['results'];
      if (results != null) {
        var result = results['result'];
        if (result.length > 1) {
          for (var item in result) {
            bahan.add(item['binding'][0]['literal'].toString());
          }
        } else {
          bahan.add(result['binding'][0]['literal'].toString());
        }
      } else {
        bahan.add("belum ada data");
      }

      //kegunaan
      xml2json.parse(response4.data);
      var jsondata4 = xml2json.toParker();
      var data4 = jsonDecode(jsondata4);
      print("data 4 : " + data4.toString());
      List<String> kegunaan = new List();
      var results2 = data4['sparql']['results'];
      if (results2 != null) {
        var result2 = results2['result'];
        if (result2.length > 1) {
          for (var item in result2) {
            kegunaan.add(item['binding'][0]['literal'].toString());
          }
        } else {
          kegunaan.add(result2['binding'][0]['literal'].toString());
        }
      } else {
        kegunaan.add("belum ada data");
      }
      print(bahan);
      print(kegunaan);
      Binding_DAM dam = new Binding_DAM(
          description: bin.description.value,
          name: bin.name.value,
          image: bin.image.value,
          video: bin.video.value,
          sumber: bin.sumber.value,
          daerah: daerah,
          bahan: bahan);

      return dam;
    }
    return null;
  }

  Future<List<Search_Result>> getPostSearching(String keyword) async {
    if (keyword != "") {
      Response response = await dio.get(url_postSearching +
          keyword +
          url_postSearching2 +
          keyword +
          url_postSearching3 +
          keyword +
          url_postSearching4 +
          keyword +
          url_postSearching5 +
          keyword +
          url_postSearching6);
      List<Search_Result> bind = new List();
      if (response.statusCode == 200) {
        // parse xml to json
        xml2json.parse(response.data);
        var jsondata = xml2json.toGData();
        var data = json.decode(jsondata);
        var result = data['sparql']['results']['result'];
        if (result.length > 1) {
          for (var item in result) {
            bind.add(Search_Result(
                kategori: item['binding'][0]['literal']['\$t'].toString(),
                nama: item['binding'][1]['literal']['\$t'].toString(),
                image: item['binding'][2]['literal']['\$t'].toString()));
          }
        } else {
          bind.add(Search_Result(
              kategori: result['binding'][0]['literal']['\$t'].toString(),
              nama: result['binding'][1]['literal']['\$t'].toString(),
              image: result['binding'][2]['literal']['\$t'].toString()));
        }

        return bind;
      } else {
        return null;
      }
    }
  }

  Future<List<String>> getDaerah(filter) async {
    var url;
    if (filter == "Daerah") {
      url = url_daerah;
    } else if (filter == "Logam") {
      url = url_bahan_logam;
    } else if (filter == "Non Logam") {
      url = url_bahan_nonlogam;
    } else if (filter == "Upacara") {
      url = url_kegunaan_upacara;
    } else if (filter == "Hiburan") {
      url = url_kegunaan_hiburan;
    }
    if (url != null) {
      Response response = await dio.get(url);
      List<String> bind = new List();
      if (response.statusCode == 200) {
        // parse xml to json
        xml2json.parse(response.data);
        var jsondata = xml2json.toGData();
        var data = json.decode(jsondata);

        // looping the parsed data and input to bind list
        for (var item in data['sparql']['results']['result']) {
          bind.add(item['binding'][1]['literal']['\$t'].toString());
        }
        return bind;
      } else {
        return null;
      }
    }
  }
  //   Future<String> country() async {
  //   var res = await http.get(
  //       Uri.encodeFull("Your API url"),
  //       headers: {"Accept": "application/json"}); //if you have any auth key place here...properly..
  //   var resBody = json.decode(res.body);

  //   setState(() {
  //     country_data = resBody;
  //   });

  //   return "Sucess";
  // }

}
