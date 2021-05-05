class Head {
  List<String> vars;

  Head({this.vars});

  Head.fromJson(Map<String, dynamic> json) {
    vars = json['vars'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vars'] = this.vars;
    return data;
  }
}
