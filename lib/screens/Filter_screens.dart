import 'package:alatmusik/Component/alatmusik_item.dart';
import 'package:alatmusik/models/Binding_AlatMusik.dart';
import 'package:alatmusik/models/Search_Result.dart';
import 'package:alatmusik/screens/Detail_AM_Screens.dart';
import 'package:alatmusik/services/api/repository.dart';
import 'package:alatmusik/services/constants/constants.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final String filter;
  const FilterScreen({Key key, this.filter}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  ApiRepository apiRepository = new ApiRepository();
  Future<List<Search_Result>> list_alatmusik;

  // // Future<List<Search_Result>> get_alatmusik(selected) async {
  // //   Future<List<Search_Result>> data;
  // //   data = apiRepository.getListPostSearching(selected);
  // //   return data;
  // }

  String selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Filter " + widget.filter),
          centerTitle: true,
          backgroundColor: Colors.red[300]),
      body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 25),
          child: Column(
            children: <Widget>[
              FutureBuilder(
                  future: apiRepository.getListFilter(widget.filter),
                  builder: (context, AsyncSnapshot<List<String>> snapshot) {
                    print(snapshot.data);
                    if (snapshot.data == null) {
                      return (Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ));
                    } else {
                      return DecoratedBox(
                          decoration: BoxDecoration(
                              border: new Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Stack(
                              children: <Widget>[
                                DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    dropdownColor: Colors.white,
                                    hint: Text("Pilih " + widget.filter),
                                    items: snapshot.data.map(
                                      (value) {
                                        return DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selected = value;
                                        list_alatmusik = apiRepository
                                            .getListPostSearching(value);
                                      });
                                    },
                                    value:
                                        selected, //pasing the default id that has to be viewed... //i havnt used something ... //you can place some (id)
                                  ),
                                )
                              ],
                            ),
                          ));
                    }
                  }),
              SizedBox(height: 20),
              FutureBuilder(
                future: list_alatmusik,
                builder:
                    (context, AsyncSnapshot<List<Search_Result>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Container(color: Colors.white);
                      break;
                    case ConnectionState.waiting:
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                      break;
                    case ConnectionState.active:
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    case ConnectionState.done:
                      if (snapshot.data == null) {
                        return (Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ));
                      } else {
                        return Expanded(
                            child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 250,
                                  childAspectRatio: 3 / 4,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 40),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            Search_Result bin = snapshot.data[index];
                            Bindings_AlatMusik alatmusik =
                                new Bindings_AlatMusik(
                                    name: bin.nama, image: bin.image);
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
                        ));
                      }
                      break;
                  }
                },
              )
            ],
          )),
    );
  }
}
