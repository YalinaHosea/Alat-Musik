import 'package:alatmusik/screens/Filter_screens.dart';
import 'package:flutter/material.dart';

class FilterBahanScreen extends StatefulWidget {
  const FilterBahanScreen({Key key}) : super(key: key);

  @override
  _FilterBahanScreenState createState() => _FilterBahanScreenState();
}

class _FilterBahanScreenState extends State<FilterBahanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filter Bahan"),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.blue[200],
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
                        color: Colors.blue[200],
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FilterScreen(
                                        filter: "Logam",
                                      )));
                        },
                        child: Text(
                          "Logam",
                          style: TextStyle(color: Colors.black),
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
                        color: Colors.blue[200],
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FilterScreen(
                                        filter: "Non Logam",
                                      )));
                        },
                        child: Text(
                          "Non Logam",
                          style: TextStyle(color: Colors.black),
                        )),
                  )),
            ],
          ),
        ));
  }
}
