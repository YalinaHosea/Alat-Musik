import 'package:alatmusik/services/constants/constants.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      Expanded(
        // flex: 1,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          child: DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/angklung.jpg"),
                    fit: BoxFit.cover)),
            child: Text("Musikku",
                style: kHeadingxSTyle.copyWith(color: Colors.white)),
          ),
        ),
      ),
      Expanded(
          // flex: 2,
          child: ListView(
        children: [
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.add_location_alt,
              color: Colors.black,
            ),
            title: Text("Daerah"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.archive,
              color: Colors.black,
            ),
            title: Text("Bahan"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.multitrack_audio,
              color: Colors.black,
            ),
            title: Text("Kegunaan"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.person_sharp,
              color: Colors.black,
            ),
            title: Text("About Us"),
          )
        ],
      ))
    ]));
  }
}
