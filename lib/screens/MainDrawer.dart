import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              width: 80,
                              height: 80,
                              child: Image(
                                image: AssetImage('assets/images/angklung.jpg'),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "MUSIK INDONESIA",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    //Now let's Add the button for the Menu
                    //and let's copy that and modify it
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      title: Text("Daerah"),
                    ),

                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      title: Text("Bahan"),
                    ),

                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.volume_down,
                        color: Colors.black,
                      ),
                      title: Text("Kegunaan"),
                    ),
                  ])))
    ]);
  }
}
