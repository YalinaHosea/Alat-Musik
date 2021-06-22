import 'package:alatmusik/models/Head.dart';
import 'package:alatmusik/models/Results_Daerah.dart';

class Daerah {
  Head head;
  Results_Daerah results;

  Daerah({this.head, this.results});

  // Daerah.fromJson(Map<String, dynamic> json) {
  //   head = json['head'] != null ? new Head.fromJson(json['head']) : null;
  //   results =
  //       json['results'] != null ? new Results.fromJson(json['results']) : null;
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
