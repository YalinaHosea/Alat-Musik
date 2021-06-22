import 'package:alatmusik/screens/Filter_screens.dart';
import 'package:flutter/material.dart';

class FIlterKegunaanScreen extends StatefulWidget {
  const FIlterKegunaanScreen({Key key}) : super(key: key);

  @override
  _FIlterKegunaanScreenState createState() => _FIlterKegunaanScreenState();
}

class _FIlterKegunaanScreenState extends State<FIlterKegunaanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black38),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FilterScreen(
                                        filter: "Upacara",
                                      )));
                        },
                        child: Text(
                          "Upacara",
                          style: TextStyle(color: Colors.black26),
                        )),
                  )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FilterScreen(
                                        filter: "Hiburan",
                                      )));
                        },
                        child: Text(
                          "Hiburan",
                          style: TextStyle(color: Colors.black26),
                        )),
                  )),
            ],
          ),
        ));
  }
}
