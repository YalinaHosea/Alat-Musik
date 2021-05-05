import 'package:alatmusik/models/Deskripsi.dart';

class Bindings {
  Description description;
  Description name;
  Description image;
  Description video;
  Description sumber;

  Bindings({this.description, this.name, this.image, this.video, this.sumber});

  Bindings.fromJson(Map<String, dynamic> json) {
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    name = json['name'] != null ? new Description.fromJson(json['name']) : null;
    image =
        json['image'] != null ? new Description.fromJson(json['image']) : null;
    video =
        json['video'] != null ? new Description.fromJson(json['video']) : null;
    sumber = json['sumber'] != null
        ? new Description.fromJson(json['sumber'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.description != null) {
      data['description'] = this.description.toJson();
    }
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.video != null) {
      data['video'] = this.video.toJson();
    }
    if (this.sumber != null) {
      data['sumber'] = this.sumber.toJson();
    }
    return data;
  }
}
