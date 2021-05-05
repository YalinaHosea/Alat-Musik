import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alatmusik/screens/home_screens.dart';

void main() => runApp(MyApp(home: HomeScreen()));

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
