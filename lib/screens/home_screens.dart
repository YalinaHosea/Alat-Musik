import 'package:alatmusik/services/api/repository.dart';
import 'package:alatmusik/services/constants/constants.dart';
import 'package:flutter/material.dart';



class home_screens extends StatefulWidget {
  @override
  _home_screensState createState() => _home_screensState();
}

class _home_screensState extends State<home_screens> {
SharedPreferences sharedPreferences;
  ApiRepository apiRepository = new ApiRepository();


  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return (Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ));
            } else {
              return (Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("MUSIKU",
                              style: TextStyle(
                                  color: kBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))
                        ],
                      ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Hello temukan Alat Musik yang kamu cari",
                      style: kSubheadingextStyle.copyWith(fontSize: 20)),
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
                          "Search for anything",
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
                    future: apiRepository.getListkategory,
                    builder: (context, snapshot) {
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
                                Category cat = snapshot.data[index];
                                return Stack(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
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
                                        child: GestureDetector(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => TopikScreen(
                                                        category: cat,
                                                      ))),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                url_gambar_kategori + cat.foto,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              padding: EdgeInsets.all(15),
                                              height: index.isEven ? 200 : 240,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                Container(
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      new AlwaysStoppedAnimation<
                                                          Color>(kBlueColor),
                                                ),
                                              ),
                                              padding: EdgeInsets.all(15),
                                              height: index.isEven ? 200 : 240,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0),
                                                ),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      new AlwaysStoppedAnimation<
                                                          Color>(kBlueColor),
                                                ),
                                              ),
                                              padding: EdgeInsets.all(15),
                                              height: index.isEven ? 200 : 240,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0),
                                                ),
                                              ),
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
                                            cat.namaKategori,
                                            style: kTitleTextStyle.copyWith(
                                                color: Colors.white),
                                          ),
                                          // Text(
                                          //   cat.numOfCourses.toString() +
                                          //       ' Courses',
                                          //   style: kSubtitleTextStyle.copyWith(
                                          //       color: Colors.white,
                                          //       fontSize: 15,
                                          //       fontWeight: FontWeight.w300),
                                          // ),
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
              ));
            }
          },
        ),
      ),
    );
  }
}