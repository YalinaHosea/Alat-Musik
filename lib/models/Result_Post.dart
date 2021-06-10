import 'package:alatmusik/models/Binding_Post.dart';

class Results_Post {
  List<Bindings_Post> bindings;

  Results_Post({this.bindings});

  // Results_Post.fromJson(Map<String, dynamic> json) {
  //   if (json['bindings'] != null) {
  //     bindings = new List<Bindings_Post>();
  //     json['bindings'].forEach((v) {
  //       bindings.add(new Bindings_Post.fromJson(v));
  //     });
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.bindings != null) {
  //     data['bindings'] = this.bindings.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
