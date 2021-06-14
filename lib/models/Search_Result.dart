class Search_Result {
  String kategori;
  String nama;
  String image;

  Search_Result({this.kategori, this.nama, this.image});

  Search_Result.fromJson(Map<String, dynamic> json) {
    kategori = json['type'];
    nama = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.kategori;
    data['value'] = this.nama;
    return data;
  }
}
