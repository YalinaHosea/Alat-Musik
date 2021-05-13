import 'package:alatmusik/models/Binding_AlatMusik.dart';
import 'package:alatmusik/models/Binding_DAM.dart';
import 'package:alatmusik/models/Bindings_Category.dart';
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
  Future<List<Bindings_AlatMusik>> get getListAlatMusik =>
      provider.getAlatMusik();
  Future<List<Binding_DAM>> get getListDetailAlatMusik =>
      provider.getDetailAlatMusik();
}
