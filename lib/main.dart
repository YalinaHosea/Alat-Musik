// TODO Implement this library.import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   var user = pref.getString("user");
//   runApp(MyApp(home: user == null ? LoginScreen() : HomeScreen()));
// }

class MyApp extends StatelessWidget {
  final home;

  const MyApp({Key key, this.home}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Alat Musik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: home,
    );
  }
}

// main() async {
//   var payload = Uri.encodeComponent("SELECT ?a ?b ?c WHERE {?a ?b ?c .}");
//   var headers = new Map<String, String>();
//   headers['Content-Type'] = 'application/x-www-form-urlencoded';
//   headers['Accept'] = 'application/json';

//   var response = await http.post(
//       'https://app.alunalun.info/fuseki/planet/query',
//       headers: headers,
//       body: "query=${payload}");

//   if (response.statusCode == 200) {
//     Map value = json.decode(response.body);

//     var head = SparqlResult.fromJson(value);
//     for (var data in head.results.listTriples) {
//       print(data);
//     }
