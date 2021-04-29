class musik {
  Head head;
  Results results;

  musik({this.head, this.results});

  musik.fromJson(Map<String, dynamic> json) {
    head = json['head'] != null ? new Head.fromJson(json['head']) : null;
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.head != null) {
      data['head'] = this.head.toJson();
    }
    if (this.results != null) {
      data['results'] = this.results.toJson();
    }
    return data;
  }
}

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

class Bindings {
  Alatmusik alatmusik;
  Alatmusik gambar;
  Alatmusik video;

  Bindings({this.alatmusik, this.gambar, this.video});

  Bindings.fromJson(Map<String, dynamic> json) {
    alatmusik = json['alatmusik'] != null
        ? new Alatmusik.fromJson(json['alatmusik'])
        : null;
    gambar =
        json['gambar'] != null ? new Alatmusik.fromJson(json['gambar']) : null;
    video =
        json['video'] != null ? new Alatmusik.fromJson(json['video']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.alatmusik != null) {
      data['alatmusik'] = this.alatmusik.toJson();
    }
    if (this.gambar != null) {
      data['gambar'] = this.gambar.toJson();
    }
    if (this.video != null) {
      data['video'] = this.video.toJson();
    }
    return data;
  }
}

class Alatmusik {
  String type;
  String value;

  Alatmusik({this.type, this.value});

  Alatmusik.fromJson(Map<String, dynamic> json) {
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
