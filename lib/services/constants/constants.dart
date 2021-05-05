import 'package:flutter/material.dart';

const kTextColor = Color(0xFF0D1333);
const kBlueColor = Color(0xFF80b155);
const kBestSellerColor = Color(0xFFFFD073);
const kGreenColor = Color(0xFF49CC96);
const kRedColor = Color(0xFFE68C8C);
const kGrey = Color(0xFFD9D9D9);

const base_url = "https://app.alunalun.info/fuseki/alatmusik/query";
const url_category =
    "https://app.alunalun.info/fuseki/alatmusik/query?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0APREFIX+schema%3A+%3Chttp%3A%2F%2Fschema.org%2F%3E+%0APREFIX+%3A++++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+dbpedia-owl%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E+%0APREFIX+obda%3A++%3Chttps%3A%2F%2Fw3id.org%2Fobda%2Fvocabulary%23%3E+%0APREFIX+am1%3A+++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23am%3A%3E+%0APREFIX+PROV-O%3A+%3Chttp%3A%2F%2Fwww.w3.org%2Fns%2Fprov%23%3E+%0APREFIX+am%3A++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+foaf%3A++%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0APREFIX+upacara%3A+%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Fsenipertunjukan%23%3E+%0APREFIX+dbo%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E%0A%0ASELECT+%3Fcategory+%3Fimage%0Awhere+%7B%0A%3FsubClass+rdfs%3Alabel+%3Fcategory+.%0A%3FsubClass+schema%3Aimage+%3Fimage+.%0A%3FsubClass+rdfs%3AsubClassOf+am%3ACategory+.%0A%7D+ORDER+BY+%3Fcategory+ASC(%3Fcategory)%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A";
// const url_gambar_category ="";
const url_gambar_alatmusik = "";
const url_detailasm = "";

const kHeadingxSTyle = TextStyle(
  fontSize: 28,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);
const kSubheadingextStyle = TextStyle(
  fontSize: 24,
  color: Color(0xFF336a29),
  height: 2,
);

const kTitleTextStyle = TextStyle(
  fontSize: 20,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);

const kSubtitleTextStyle = TextStyle(
  fontSize: 18,
  color: kTextColor,
);

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF80b155),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
