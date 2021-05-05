import 'package:alatmusik/models/Bindings_Category.dart';

class Results {
  List<Bindings> bindings;

  Results({this.bindings});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['bindings'] != null) {
      bindings = new List<Bindings>();
      json['bindings'].forEach((v) {
        bindings.add(new Bindings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bindings != null) {
      data['bindings'] = this.bindings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
