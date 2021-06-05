class Bind_Detail {
  Results results;

  Bind_Detail({this.results});

  Bind_Detail.fromJson(Map<String, dynamic> json) {
    print('benar ? ' + (json['results'] != null).toString());
    results = json['results'] != null
        ? new Results.createBind(json['results']['result'])
        : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.results != null) {
  //     data['results'] = this.results.toJson();
  //   }
  //   return data;
  // }
}

class Results {
  Bindings bindings;

  Results({this.bindings});

  Results.createBind(Map<String, dynamic> json) {
    if (json['binding'] != null) {
      bindings = new Bindings(
          description: new Description(
              type: '', value: json['binding'][0]['literal'].toString()),
          name: new Description(
              type: '', value: json['binding'][1]['literal'].toString()),
          image: new Description(
              type: '', value: json['binding'][2]['literal'].toString()),
          video: new Description(
              type: '', value: json['binding'][3]['literal'].toString()),
          sumber: new Description(
              type: '', value: json['binding'][4]['literal'].toString()));
    }
  }

  //  bindings = new List<Bindings>();
  //     json['bindings'].forEach((v) {
  //       bindings.add(new Bindings.fromJson(v));
  //     });

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.bindings != null) {
  //     data['bindings'] = this.bindings.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Bindings {
  Description description;
  Description name;
  Description image;
  Description video;
  Description sumber;

  Bindings({this.description, this.name, this.image, this.video, this.sumber});

  Bindings.fromJson(Map<String, dynamic> json) {
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    name = json['name'] != null ? new Description.fromJson(json['name']) : null;
    image =
        json['image'] != null ? new Description.fromJson(json['image']) : null;
    video =
        json['video'] != null ? new Description.fromJson(json['video']) : null;
    sumber = json['sumber'] != null
        ? new Description.fromJson(json['sumber'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.description != null) {
      data['description'] = this.description.toJson();
    }
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.video != null) {
      data['video'] = this.video.toJson();
    }
    if (this.sumber != null) {
      data['sumber'] = this.sumber.toJson();
    }
    return data;
  }
}

class Description {
  String type;
  String value;

  Description({this.type, this.value});

  Description.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}
