import 'package:alatmusik/services/api/provider.dart';
import 'package:alatmusik/services/constants/constants.dart';

class ApiRepository {
  String base = base_url;
  var dio = Dio();
  ApiProvider provider;

  ApiRepository() {
    provider = ApiProvider(base, dio);
  }
  Future<List<Category>> get getListkategory => provider.getCategory();
  Future<List<Topik>> getListTopik(String id_kategori) =>
      provider.getTopik(id_kategori);
  Future<List<Materi>> getListSubTopik(int id_topik) =>
      provider.getSubTopik(id_topik);