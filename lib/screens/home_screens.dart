import 'package:alatmusik/models/Bindings_Category.dart';
import 'package:alatmusik/models/Category.dart';
import 'package:alatmusik/services/api/repository.dart';
import 'package:alatmusik/services/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'maindrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences sharedPreferences;
  ApiRepository apiRepository = new ApiRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MUSIKU"),
        ),
        //Now we are going to open a new file
        // where we will create the layout of the Drawer
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Alat-alat Musik Tradisional Indonesia",
                    style: TextStyle(
                        color: kBlueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F7),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/search.svg"),
                      SizedBox(width: 16),
                      Text(
                        "Cari Alat Musik",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0XFFA0A5BD),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Category", style: kHeadingxSTyle),
                  ],
                ),
                SizedBox(height: 10),
                FutureBuilder(
                  future: apiRepository.getListkategori,
                  builder: (context, AsyncSnapshot<List<Bindings>> snapshot) {
                    if (snapshot.data == null) {
                      return (Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ));
                    } else {
                      return (Expanded(
                        child: StaggeredGridView.countBuilder(
                            padding: EdgeInsets.all(0),
                            crossAxisCount: 2,
                            itemCount: snapshot.data.length,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            itemBuilder: (context, index) {
                              Bindings bin = snapshot.data[index];
                              return Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    child: ShaderMask(
                                      shaderCallback: (rect) {
                                        return LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black
                                          ],
                                        ).createShader(Rect.fromLTRB(
                                            0, 30, rect.width, rect.height));
                                      },
                                      blendMode: BlendMode.darken,
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F4EF),
                                          image: DecorationImage(
                                            colorFilter: new ColorFilter.mode(
                                                Colors.black.withOpacity(0.4),
                                                BlendMode.darken),
                                            image: AssetImage(
                                                "assets/images/gesek.jpg" +
                                                    bin.image.value),
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topCenter,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    //hanya bisa ada di anak nya stack
                                    bottom: 15,
                                    left: 15,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          bin.category.value,
                                          style: kTitleTextStyle.copyWith(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1)),
                      ));
                    }
                  },
                ),
              ],
            )));
  }
}
