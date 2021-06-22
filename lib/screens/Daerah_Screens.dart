// import 'dart:convert';
// import 'package:alatmusik/models/Binding_Daerah.dart';
// import 'package:alatmusik/services/api/repository.dart';
// import 'package:alatmusik/services/constants/constants.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Daerah extends StatefulWidget {
//   final Bindings_Daerah daerah;
//   // String _valProvince;

//   const Daerah({Key key, this.daerah}) : super(key: key);

//   @override
//   _DaerahState createState() => _DaerahState();
// }

// class _DaerahState extends State<Daerah> {
//   SharedPreferences sharedPreferences;
//   ApiRepository apiRepository = new ApiRepository();
//   List country_data = List();
//   String countryid;
// }

// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   this.country();
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text("Dropdown #API"),
//       centerTitle: true,
//       backgroundColor: Colors.black,
//     ),
//     body: Container(
//         padding: EdgeInsets.all(15.0), //some padding
//         child: Column(
//           children: <Widget>[
//             DecoratedBox(
//                 decoration: BoxDecoration(
//                     border: new Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
//                   //Why you have used Stack ??????
//                   //B'coz it make clickable to whole decorated Box!!!! as you can click anywhere for dropdown !!!
//                   child: Stack(
//                     children: <Widget>[
// //Country Text
//                       Text(
//                         "Country:",
//                         style: TextStyle(
//                           fontSize: 13.0,
//                         ),
//                       ),

// //Dropdown that has no loine beneath

//                       DropdownButtonHideUnderline(
//                         child:

// //starting the dropdown
//                             DropdownButton(
//                           items: country_data.map((item) {
//                             return new DropdownMenuItem(
//                                 child: new Text(
//                                   item[
//                                       'CountryName'], //Names that the api dropdown contains
//                                   style: TextStyle(
//                                     fontSize: 13.0,
//                                   ),
//                                 ),
//                                 value: item['CountryID']
//                                     .toString() //Id that has to be passed that the dropdown has.....
//                                 //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
//                                 );
//                           }).toList(),
//                           onChanged: (String newVal) {
//                             setState(() {
//                               countryid = newVal;
//                               print(countryid.toString());
//                             });
//                           },
//                           value:
//                               countryid, //pasing the default id that has to be viewed... //i havnt used something ... //you can place some (id)
//                         ),
//                       )
//                     ],
//                   ),
//                 )),
//           ],
//         )),
//   );
// }
