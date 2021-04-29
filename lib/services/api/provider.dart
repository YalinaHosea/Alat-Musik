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

  Future<List<Category>> getCategory() async {
    Response response = await dio.get(url_category);
    List<Category> categories = [];
    if (response.statusCode == 200) {
      for (var item in response.data["ListKategori"]) {
        Category category = Category.fromJson(item);
        categories.add(category);
      }
      return categories;
    } else {
      return null;
    }
  }

   Future<List<Topik>> getTopik(String id_kategori) async {
    Response response = await dio.get(url_topik + "/" + id_kategori);
    List<Topik> topiks = [];

    if (response.statusCode == 200) {
      for (var item in response.data["ListTopik"]) {
        Topik topik = Topik.fromJson(item);
        topiks.add(topik);
      }
      return topiks;
    } else {
      return null;
    }
  }

  Future<List<Materi>> getSubTopik(int id_topik) async {
    Response response = await dio.get(url_materi + "/" + id_topik.toString());
    List<Materi> subtopiks = [];
    if (response.statusCode == 200) {
      for (var item in response.data["ListMateri"]) {
        Materi sub = Materi.fromJson(item);
        subtopiks.add(sub);
      }
      return subtopiks;
    } else {
      return null;
    }
  }
}
