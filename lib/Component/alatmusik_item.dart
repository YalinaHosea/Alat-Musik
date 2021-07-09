import 'package:alatmusik/services/constants/constants.dart';
import 'package:alatmusik/services/responsive.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AlatMusikItem extends StatelessWidget {
  final String text;
  final String gambar;
  final Function onpress;
  const AlatMusikItem({Key key, this.text, this.gambar, this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ).createShader(Rect.fromLTRB(0, 30, rect.width, rect.height));
            },
            blendMode: BlendMode.darken,
            child: GestureDetector(
              onTap: onpress,
              child: CachedNetworkImage(
                imageUrl: gambar,
                imageBuilder: (context, imageProvider) => Container(
                  padding: EdgeInsets.all(15),
                  height: 200,
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
                      valueColor: new AlwaysStoppedAnimation<Color>(kBlueColor),
                    ),
                  ),
                  padding: EdgeInsets.all(15),
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(kBlueColor),
                    ),
                  ),
                  padding: EdgeInsets.all(15),
                  height: 200,
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
          bottom: screenWidth(context, dividedBy: 13),
          left: screenWidth(context, dividedBy: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: screenWidth(context, dividedBy: 3),
                child: Text(
                  text,
                  style: kTitleTextStyle.copyWith(
                      color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
