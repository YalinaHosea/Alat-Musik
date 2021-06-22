class Bindings_Daerah {
  String longlatprovince;
  String nameprovince;
  String link;

  Bindings_Daerah({this.longlatprovince, this.nameprovince, this.link});

  String getLonglatProvince() {
    return longlatprovince;
  }

  String getNameProvince() {
    return nameprovince;
  }

  String getLink() {
    return link;
  }

  // Bindings_Daerah.fromJson(Map<String, dynamic> json) {
  //   longlatprovince = json['longlatprovince'] != null
  //       ? new Longlatprovince.fromJson(json['longlatprovince'])
  //       : null;
  //   nameprovince = json['nameprovince'] != null
  //       ? new Longlatprovince.fromJson(json['nameprovince'])
  //       : null;
  //   link = json['link'] != null ? new Link.fromJson(json['link']) : null;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.longlatprovince != null) {
  //     data['longlatprovince'] = this.longlatprovince.toJson();
  //   }
  //   if (this.nameprovince != null) {
  //     data['nameprovince'] = this.nameprovince.toJson();
  //   }
  //   if (this.link != null) {
  //     data['link'] = this.link.toJson();
  //   }
  //   return data;
  // }
}
