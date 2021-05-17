import 'package:alatmusik/models/Binding_AlatMusik.dart';
import 'package:alatmusik/models/Binding_DAM.dart';
import 'package:alatmusik/services/api/repository.dart';
import 'package:alatmusik/services/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Detail_alatmusik_screens extends StatefulWidget {
  final Bindings_AlatMusik alatmusik;

  const Detail_alatmusik_screens({Key key, this.alatmusik}) : super(key: key);

  @override
  _Detail_alatmusik_screensState createState() =>
      _Detail_alatmusik_screensState();
}

class _Detail_alatmusik_screensState extends State<Detail_alatmusik_screens> {
  var desription;
  SharedPreferences sharedPreferences;
  ApiRepository apiRepository = new ApiRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.alatmusik.getName(), style: kHeadingxSTyle)
                  ],
                ),
                SizedBox(height: 10),
                FutureBuilder(
                  future: apiRepository.getListDetailAlatMusik(widget.alatmusik.),
                  builder:
                      (context, AsyncSnapshot<List<Binding_DAM>> snapshot) {
                    print(snapshot.data);
                    if (snapshot.data == null) {
                      return (Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ));
                    } else {
                      
                    }
                  },
                ),
              ],
            )));
  }
}
