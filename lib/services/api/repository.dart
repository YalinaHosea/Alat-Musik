import 'package:alatmusik/models/Binding_AlatMusik.dart';
import 'package:alatmusik/models/Binding_DAM.dart';
import 'package:alatmusik/models/Binding_Daerah.dart';
import 'package:alatmusik/models/Bindings_Category.dart';
import 'package:alatmusik/models/Search_Result.dart';
import 'package:alatmusik/services/api/provider.dart';
import 'package:alatmusik/services/constants/constants.dart';
import 'package:dio/dio.dart';

class ApiRepository {
  String base = base_url;
  var dio = Dio();
  ApiProvider provider;

  ApiRepository() {
    provider = ApiProvider(base, dio);
  }
  Future<List<Bindings_Category>> get getListkategori => provider.getKategori();
  Future<List<Bindings_AlatMusik>> getListAlatMusik(String category) =>
      provider.getAlatMusik(category);
  Future<Binding_DAM> getListDetailAlatMusik(String nama_alatmusik) =>
      provider.getDetailAlatMusik(nama_alatmusik);
  Future<List<Search_Result>> getListPostSearching(String keyword) =>
      provider.getPostSearching(keyword);
  Future<List<String>> getListDaerah(String filter) =>
      provider.getDaerah(filter);
}
