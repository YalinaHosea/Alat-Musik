import 'package:alatmusik/models/Bindings_Category.dart';
import 'package:alatmusik/screens/AlatMusik_Screens.dart';
import 'package:alatmusik/services/api/repository.dart';
import 'package:alatmusik/services/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cari Alat Musik"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                })
          ],
        ),
        //Now we are going to open a new file
        // where we will create the layout of the Drawer
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Text("Alat-alat Musik Tradisional Indonesia",
                //     style: TextStyle(
                //         color: kBlueColor,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Category", style: kHeadingxSTyle),
                  ],
                ),
                SizedBox(height: 15),
                FutureBuilder(
                  future: apiRepository.getListkategori,
                  builder: (context,
                      AsyncSnapshot<List<Bindings_Category>> snapshot) {
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
                          Bindings_Category bin = snapshot.data[index];
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
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => AlatMusikScreens(
                                                  category: bin,
                                                ))),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          url_gambar_category + bin.getImage(),
                                      imageBuilder: (context, imageProvider) =>
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
                                      placeholder: (context, url) => Container(
                                        child: Center(
                                          child: CircularProgressIndicator(
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
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        child: Center(
                                          child: CircularProgressIndicator(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      bin.getCategory(),
                                      style: kTitleTextStyle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Nanggroe Aceh Darussalam",
    "Sumatera Utara",
    "Sumatera Barat",
    "Riau",
    "Kepulauan Riau",
    "Jambi",
    "Bengkulu",
    "Sumatera Selatan",
    "Kepulauan Bangka Belitung",
    "Lampung",
    "Banten",
    "DKI Jakarta",
    "Jawa Barat",
    "Jawa Tengah",
    "Jawa Timur",
    "DI Yogyakarta",
    "Bali",
    "Nusa Tenggara Barat",
    "Nusa Tenggara Timur",
    "Kalimantan Utara",
    "Kalimantan Selatan",
    "Kalimantan Barat",
    "Kalimantan Timur",
    "Kalimantan Tengah",
    "Gorontalo",
    "Sulawesi Utara",
    "Sulawesi Selatan",
    "Sulawesi Barat",
    "Sulawesi Tenggara",
    "Sulawesi Tengah",
    "Maluku",
    "Maluku Utara",
    "Papua",
    "Papua Barat"
  ];

  final recentCities = [
    "Kepulauan Riau",
    "Jambi",
    "Bengkulu",
    "Sumatera Selatan",
    "Kepulauan Bangka Belitung",
    "Lampung",
    "Banten"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some results based on the selection
    return Container(
      height: 100.0,
      width: 100.0,
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
