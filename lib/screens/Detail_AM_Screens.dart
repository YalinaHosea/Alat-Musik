import 'package:alatmusik/models/Binding_AlatMusik.dart';
import 'package:alatmusik/models/Binding_DAM.dart';
import 'package:alatmusik/services/api/repository.dart';
import 'package:alatmusik/services/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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
  redirect(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                    var list_bahan = snapshot.data.bahan;
                    var list_kegunaan = snapshot.data.kegunaan;
                    print(list_kegunaan);

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
                                "Daerah : ",
                                style: kTitleTextStyle.copyWith(
                                    color: Colors.black38),
                              ),
                              Text(
                                snapshot.data.daerah,
                                style: kTitleTextStyle.copyWith(
                                    color: Colors.black38),
                              ),
                              SizedBox(height: 10),
                              for (var bahan in list_bahan) Text(bahan),
                              // for (var kegunaan in list_kegunaan)
                              //   Text(kegunaan),

                              // snapshot.data.kegunaan
                              //     .map((kegunaan) =>
                              //         new Text(kegunaan.toString()))
                              //     .toList(),
                              Text(
                                "Video ",
                                style: kTitleTextStyle.copyWith(
                                    color: Colors.black38),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: FlatButton(
                                        padding: EdgeInsets.all(10),
                                        color: kBlueColor,
                                        onPressed: () {
                                          redirect(snapshot.data.video);
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.play_circle_filled,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Putar video " +
                                                  snapshot.data.name,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        )),
                                  )),
                            ])),
                      ));
                    }
                  },
                ),
              ],
            )));
  }
}
