import 'package:alatmusik/models/Binding_Daerah.dart';

class Results_Daerah {
  List<Bindings_Daerah> bindings;

  Results_Daerah({this.bindings});

  // Results_Daerah.fromJson(Map<String, dynamic> json) {
  //   if (json['bindings'] != null) {
  //     bindings = new List<Bindings_Daerah>();
  //     json['bindings'].forEach((v) {
  //       bindings.add(new Bindings_Daerah.fromJson(v));
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
