import 'package:alatmusik/models/Head.dart';
import 'package:alatmusik/models/Result_Post.dart';

class Post {
  Head head;
  Results_Post results;

  Post({this.head, this.results});

  // Post.fromJson(Map<String, dynamic> json) {
  //   head = json['head'] != null ? new Head.fromJson(json['head']) : null;
  //   results = json['results'] != null
  //       ? new Results_Post.fromJson(json['results'])
  //       : null;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.head != null) {
  //     data['head'] = this.head.toJson();
  //   }
  //   if (this.results != null) {
  //     data['results'] = this.results.toJson();
  //   }
  //   return data;
  // }
}
