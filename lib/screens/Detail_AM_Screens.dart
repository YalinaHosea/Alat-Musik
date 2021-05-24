import 'package:alatmusik/models/Binding_AlatMusik.dart';
import 'package:alatmusik/models/Binding_DAM.dart';
import 'package:alatmusik/services/api/repository.dart';
import 'package:alatmusik/services/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Detail_alatmusik_screens extends StatefulWidget {
  final Bindings_AlatMusik alatmusik;
  final String url;

  const Detail_alatmusik_screens({Key key, this.alatmusik, this.url})
      : super(key: key);

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
                    Text("Detail Alat Musik ", style: kHeadingxSTyle)
                  ],
                ),
                SizedBox(height: 10),
                FutureBuilder(
                  future: apiRepository.getListDetailAlatMusik,
                  builder: (context, AsyncSnapshot<Binding_DAM> snapshot) {
                    print(snapshot.data);
                    if (snapshot.data == null) {
                      return (Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ));
                    } else {
                      return Expanded(
                          child: (Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                            CachedNetworkImage(imageUrl: widget.url),
                            Text(
                              snapshot.data.name,
                              style:
                                  kTitleTextStyle.copyWith(color: Colors.white),
                            ),
                            Text(
                              snapshot.data.description,
                              style:
                                  kTitleTextStyle.copyWith(color: Colors.white),
                            ),
                            Text(
                              snapshot.data.video,
                              style:
                                  kTitleTextStyle.copyWith(color: Colors.white),
                            ),
                            Text(
                              snapshot.data.sumber,
                              style:
                                  kTitleTextStyle.copyWith(color: Colors.white),
                            ),
                          ])));
                    }
                  },
                ),
              ],
            )));
  }
}
