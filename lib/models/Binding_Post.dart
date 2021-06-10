import 'package:alatmusik/models/Label.dart';
import 'package:alatmusik/models/Link.dart';

class Bindings_Post {
  String labelclass;
  String label;
  String image;
  String link;
  // Labelclass labelclass;
  // Labelclass label;
  // Labelclass image;
  // Link link;

  Bindings_Post({this.labelclass, this.label, this.image, this.link});

  String getLabelClass() {
    return labelclass;
  }

  String getLabel() {
    return label;
  }

  String getImage() {
    return image;
  }

  String getLink() {
    return link;
  }

  // Bindings_Post.fromJson(Map<String, dynamic> json) {
  //   labelclass = json['labelclass'] != null
  //       ? new Labelclass.fromJson(json['labelclass'])
  //       : null;
  //   label =
  //       json['label'] != null ? new Labelclass.fromJson(json['label']) : null;
  //   image =
  //       json['image'] != null ? new Labelclass.fromJson(json['image']) : null;
  //   link = json['link'] != null ? new Link.fromJson(json['link']) : null;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.labelclass != null) {
  //     data['labelclass'] = this.labelclass.toJson();
  //   }
  //   if (this.label != null) {
  //     data['label'] = this.label.toJson();
  //   }
  //   if (this.image != null) {
  //     data['image'] = this.image.toJson();
  //   }
  //   if (this.link != null) {
  //     data['link'] = this.link.toJson();
  //   }
  //   return data;
  // }
}
