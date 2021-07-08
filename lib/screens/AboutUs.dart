import 'package:alatmusik/services/constants/constants.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.amber[200],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Aplikasi Alat Musik Tradisional Indonesia',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Aplikasi Alat Musik Tradisional berbasis mobile ini merupakan salah satu proyek Alun-alun. Dimana aplikasi ini telah mengembangkan aplikasi  versi yang sebelumnya yang berbasis website. Aplikasi ini dibuat agar dapat menyajikan informasi alat musik dengan lebih fleksibel dan maksimal, sehingga dapat diterima oleh pengguna secara keseluruhan. Fitur yang disediakan pada aplikasi ini adalah fitur Searching, dan Filter untuk mempermudah pengguna dalam melakukan pencarian yang diinginkan ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
