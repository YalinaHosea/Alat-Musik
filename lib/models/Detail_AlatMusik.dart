import 'package:alatmusik/models/Head.dart';
import 'package:alatmusik/models/Result_DetailAlatMusik.dart';

class Materi {
  Head head;
  Results_DetailAlatMusik results;

  Materi({this.head, this.results});

  // Materi.fromJson(Map<String, dynamic> json) {
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
