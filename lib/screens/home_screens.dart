import 'package:alatmusik/Component/alatmusik_item.dart';
import 'package:alatmusik/models/Binding_AlatMusik.dart';
import 'package:alatmusik/models/Bindings_Category.dart';
import 'package:alatmusik/models/Search_Result.dart';
import 'package:alatmusik/screens/AlatMusik_Screens.dart';
import 'package:alatmusik/screens/Detail_AM_Screens.dart';
import 'package:alatmusik/services/api/repository.dart';
import 'package:alatmusik/services/constants/constants.dart';
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
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.blue[200],
          // title: Text("Cari Alat Musik"),
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
                    Text(
                      ' AlMusTra',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify,
                    ),
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
                          return AlatMusikItem(
                              text: bin.getCategory(),
                              gambar: url_gambar_category + bin.getImage(),
                              onpress: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AlatMusikScreens(
                                            category: bin,
                                          ))));
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
  final alatmusik = [];

  final recentAlatMusik = [];

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
    ApiRepository apiRepository = new ApiRepository();
    // show some results based on the selection

    return FutureBuilder(
      future: apiRepository.getListPostSearching(query),
      builder: (context, AsyncSnapshot<List<Search_Result>> snapshot) {
        print(snapshot.data);
        if (snapshot.data == null) {
          return (Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ));
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            child: (Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 40),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Search_Result bin = snapshot.data[index];
                Bindings_AlatMusik alatmusik =
                    new Bindings_AlatMusik(name: bin.nama, image: bin.image);
                return AlatMusikItem(
                  text: bin.nama,
                  gambar: url_gambar_alatmusik +
                      bin.kategori +
                      "/1000x564/" +
                      bin.image,
                  onpress: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Detail_alatmusik_screens(
                                kategori: bin.kategori,
                                alatmusik: alatmusik,
                                url: url_gambar_alatmusik +
                                    bin.kategori +
                                    "/1000x564/" +
                                    bin.image,
                              ))),
                );
              },
            ))),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? recentAlatMusik
        : alatmusik.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        // leading: Icon(Icons.music_note),
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
