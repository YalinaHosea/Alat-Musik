// ignore: camel_case_types
class Bindings_AlatMusik {
  String name;
  String image;

  Bindings_AlatMusik({this.name, this.image});

  String getName() {
    return name;
  }

  String getImage() {
    return image;
  }

  // Bindings_AlatMusik.fromJson(Map<String, dynamic> json) {
  //   name = json['name'] != null ? new Name.fromJson(json['name']) : null;
  //   image = json['image'] != null ? new Name.fromJson(json['image']) : null;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.name != null) {
  //     data['name'] = this.name.toJson();
  //   }
  //   if (this.image != null) {
  //     data['image'] = this.image.toJson();
  //   }
  //   return data;
  // }
}
