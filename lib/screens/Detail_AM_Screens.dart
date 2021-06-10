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
  // final Function function_video;

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
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black38),
          backgroundColor: Colors.white,
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     // Text("Detail Alat Musik ", style: kHeadingxSTyle)
                //   ],
                // ),
                // SizedBox(height: 10),
                FutureBuilder(
                  future: apiRepository
                      .getListDetailAlatMusik(widget.alatmusik.name),
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
                          child: SingleChildScrollView(
                        padding: EdgeInsets.zero,
                        child: (Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot.data.name,
                                style: kHeadingxSTyle,
                              ),
                              SizedBox(height: 10),
                              CachedNetworkImage(
                                imageUrl: widget.url,
                              ),
                              SizedBox(height: 10),
                              Text(
                                snapshot.data.description,
                                style: kTitleTextStyle.copyWith(
                                    color: Colors.black38),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Sumber : ",
                                style: kTitleTextStyle.copyWith(
                                    color: Colors.black38),
                              ),
                              Text(
                                snapshot.data.sumber,
                                style: kTitleTextStyle.copyWith(
                                    color: Colors.black38),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Link Video : ",
                                style: kTitleTextStyle.copyWith(
                                    color: Colors.black38),
                              ),
                              Text(
                                snapshot.data.video,
                                style: kTitleTextStyle.copyWith(
                                    color: Colors.black38),
                              ),
                            ])),
                      ));
                    }
                  },
                ),
              ],
            )));
  }
}
