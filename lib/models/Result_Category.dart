import 'package:alatmusik/models/Bindings_Category.dart';

class Results_Category {
  List<Bindings_Category> bindings;

  Results_Category({this.bindings});

  // Results.fromJson(Map<String, dynamic> json) {
  //   if (json['bindings'] != null) {
  //     bindings = new List<Bindings_Category>();
  //     json['bindings'].forEach((v) {
  //       bindings.add(new Bindings_Category.fromJson(v));
  //     });
  //   }
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.bindings != null) {
  //     data['bindings'] = this.bindings.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
