// ignore: camel_case_types
class Bindings_Category {
  String category;
  String image;

  Bindings_Category({this.category, this.image});

  String getCategory() {
    return category;
  }

  String getImage() {
    return image;
  }

  // Bindings_Category.fromJson(Map<String, dynamic> json) {
  //   category = json['category'] != null
  //       ? new Category.fromJson(json['category'])
  //       : null;
  //   image = json['image'] != null ? new Category.fromJson(json['image']) : null;
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.category != null) {
  //     data['category'] = this.category.toJson();
  //   }
  //   if (this.image != null) {
  //     data['image'] = this.image.toJson();
  //   }
  //   return data;
  // }
}
