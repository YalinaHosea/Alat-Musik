// import 'package:alatmusik/models/Post.dart';
// import 'package:flutter/material.dart';

// class SearchPage extends StatefulWidget {
//   final List<Post> posts;

//   SearchPage({@required this.posts});

//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   List<Post> _searchedPost = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           style: TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//               hintText: 'Search Post',
//               hintStyle: TextStyle(color: Colors.white),
//               border: InputBorder.none),
//           onChanged: (val) {
//             setState(() {
//               // _searchedPost = widget.posts
//               //     .where((el) => el.labelclass.contains(val))
//               //     .toList();
//             });
//           },
//         ),
//       ),
//       body: _searchedPost.isEmpty
//           ? Center(
//               child: Text(
//                 'No match',
//                 style: Theme.of(context).textTheme.headline3,
//               ),
//             )
//           : ListView.builder(
//               itemCount: _searchedPost.length,
//               itemBuilder: (ctx, i) {
//                 return Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     ListTile(
//                         // label: Text(_searchedPost[i].label),
//                         // image: Text(_searchedPost[i].image),
//                         ),
//                     Divider(
//                       height: 0,
//                     )
//                   ],
//                 );
//               },
//             ),
//     );
//   }
// }
