import 'package:alatmusik/screens/Filter_screens.dart';
import 'package:alatmusik/services/api/repository.dart';
import 'package:flutter/material.dart';

class Daerah extends StatefulWidget {
  const Daerah({Key key}) : super(key: key);

  @override
  _DaerahState createState() => _DaerahState();
}

class _DaerahState extends State<Daerah> {
  ApiRepository apiRepository = new ApiRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.red[300],
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                FutureBuilder(
                  future: apiRepository.getListFilter('Daerah'),
                  builder: (context, AsyncSnapshot<List<String>> snapshot) {
                    print(snapshot.data);
                    if (snapshot.data == null) {
                      return (Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ));
                    } else {
                      return (Expanded(
                          child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 25,
                                  ),
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Text(snapshot.data.toString());
                              })));
                    }
                  },
                ),
              ],
            )));
  }
}
