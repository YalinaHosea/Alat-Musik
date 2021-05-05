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
  Future<List<Bindings>> get getListkategori => provider.getKategori();
}
