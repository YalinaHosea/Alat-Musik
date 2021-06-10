class Link {
  String type;
  String datatype;
  String value;

  Link({this.type, this.datatype, this.value});

  Link.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    datatype = json['datatype'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['datatype'] = this.datatype;
    data['value'] = this.value;
    return data;
  }
}
