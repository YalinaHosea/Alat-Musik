import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SparqlResult {
  final HeaderSparql header;
  final Results results;

  SparqlResult(this.header, this.results);

  factory SparqlResult.fromJson(Map json) {
    var header = new HeaderSparql(List.from(json['head']['vars']));
    var results = new Results(List.from(json["results"]["bindings"]));

    return SparqlResult(header, results);
  }
}

class HeaderSparql {
  List<String> vars;

  HeaderSparql(List<String> json) : this.vars = json;
}

class Results {
  List<Tripleset> listTriples = [];

  Results(List data) {
    this.listTriples = createListTripleset(data);
  }

  List<Tripleset> createListTripleset(List data) {
    List<Tripleset> list = [];
    for (var value in data) {
      Tripleset triple = Tripleset.fromJson(value);
      list.add(triple);
    }
    return list;
  }
}

class Tripleset {
  final TypeValue a;
  final TypeValue b;
  final TypeValue c;

  Tripleset(this.a, this.b, this.c);

  factory Tripleset.fromJson(Map json) {
    return Tripleset(TypeValue.fromJson(json['a']),
        TypeValue.fromJson(json['b']), TypeValue.fromJson(json['c']));
  }

  String toString() {
    String s = "${a}\t\t${b}\t\t${c}";
    return s;
  }
}

class TypeValue {
  final String type;
  final String value;

  TypeValue(this.type, this.value);

  TypeValue.fromJson(Map json)
      : type = json['type'],
        value = json['value'];

  String toString() {
    String s = "$value";
    return s;
  }
}

main() async {
  var payload = Uri.encodeComponent("SELECT ?a ?b ?c WHERE {?a ?b ?c .}");
  var headers = new Map<String, String>();
  headers['Content-Type'] = 'application/x-www-form-urlencoded';
  headers['Accept'] = 'application/json';

  var response = await http.post(
      'https://app.alunalun.info/fuseki/planet/query',
      headers: headers,
      body: "query=${payload}");

  if (response.statusCode == 200) {
    Map value = json.decode(response.body);

    var head = SparqlResult.fromJson(value);
    for (var data in head.results.listTriples) {
      print(data);
    }
  }
}
