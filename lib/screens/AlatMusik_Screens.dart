import 'package:alatmusik/Component/alatmusik_item.dart';
import 'package:alatmusik/models/Binding_AlatMusik.dart';
import 'package:alatmusik/models/Bindings_Category.dart';
import 'package:alatmusik/screens/Detail_AM_Screens.dart';
import 'package:alatmusik/services/api/repository.dart';
import 'package:alatmusik/services/constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlatMusikScreens extends StatefulWidget {
  final Bindings_Category category;

  const AlatMusikScreens(
      {Key key, this.category, Bindings_Category Bindings_Category})
      : super(key: key);

  @override
  _AlatMusikScreensState createState() => _AlatMusikScreensState();
}

class _AlatMusikScreensState extends State<AlatMusikScreens> {
  var name;
  SharedPreferences sharedPreferences;
  ApiRepository apiRepository = new ApiRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.category.getCategory(), style: kHeadingxSTyle)
                  ],
                ),
                SizedBox(height: 10),
                FutureBuilder(
                  future:
                      apiRepository.getListAlatMusik(widget.category.category),
                  builder: (context,
                      AsyncSnapshot<List<Bindings_AlatMusik>> snapshot) {
                    print(snapshot.data);
                    if (snapshot.data == null) {
                      return (Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ));
                    } else {
                      return (Expanded(
                          child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            childAspectRatio: 3 / 4,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 40),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          Bindings_AlatMusik bin = snapshot.data[index];
                          return AlatMusikItem(
                            text: bin.getName(),
                            gambar: url_gambar_alatmusik +
                                widget.category.category +
                                "/1000x564/" +
                                bin.getImage(),
                            onpress: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Detail_alatmusik_screens(
                                          kategori:
                                              widget.category.getCategory(),
                                          alatmusik: bin,
                                          url: url_gambar_alatmusik +
                                              widget.category.category +
                                              "/1000x564/" +
                                              bin.getImage(),
                                        ))),
                          );
                        },
                      )));
                    }
                  },
                ),
              ],
            )));
  }
}
