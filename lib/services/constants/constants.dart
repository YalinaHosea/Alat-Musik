import 'package:flutter/material.dart';

const kTextColor = Color(0xFF0D1333);
const kBlueColor = Color(0xFF80b155);
const kBestSellerColor = Color(0xFFFFD073);
const kGreenColor = Color(0xFF49CC96);
const kRedColor = Color(0xFFE68C8C);
const kGrey = Color(0xFFD9D9D9);

const base_url = "https://app.alunalun.info/fuseki/alatmusik/";
const url_category =
    "https://app.alunalun.info/fuseki/alatmusik/query?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0APREFIX+schema%3A+%3Chttp%3A%2F%2Fschema.org%2F%3E+%0APREFIX+%3A++++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+dbpedia-owl%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E+%0APREFIX+obda%3A++%3Chttps%3A%2F%2Fw3id.org%2Fobda%2Fvocabulary%23%3E+%0APREFIX+am1%3A+++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23am%3A%3E+%0APREFIX+PROV-O%3A+%3Chttp%3A%2F%2Fwww.w3.org%2Fns%2Fprov%23%3E+%0APREFIX+am%3A++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+foaf%3A++%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0APREFIX+upacara%3A+%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Fsenipertunjukan%23%3E+%0APREFIX+dbo%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E%0A%0ASELECT+%3Fcategory+%3Fimage%0Awhere+%7B%0A%3FsubClass+rdfs%3Alabel+%3Fcategory+.%0A%3FsubClass+schema%3Aimage+%3Fimage+.%0A%3FsubClass+rdfs%3AsubClassOf+am%3ACategory+.%0A%7D+ORDER+BY+%3Fcategory+ASC(%3Fcategory)%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A";
const url_gambar_category =
    "https://app.alunalun.info/alatmusik/images/category/";
const url_alatmusik =
    "https://app.alunalun.info/fuseki/alatmusik/query?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0APREFIX+schema%3A+%3Chttp%3A%2F%2Fschema.org%2F%3E+%0APREFIX+%3A++++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+dbpedia-owl%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E+%0APREFIX+obda%3A++%3Chttps%3A%2F%2Fw3id.org%2Fobda%2Fvocabulary%23%3E+%0APREFIX+am1%3A+++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23am%3A%3E+%0APREFIX+PROV-O%3A+%3Chttp%3A%2F%2Fwww.w3.org%2Fns%2Fprov%23%3E+%0APREFIX+am%3A++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+foaf%3A++%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0APREFIX+upacara%3A+%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Fsenipertunjukan%23%3E%0APREFIX+db%3A+%3Chttp%3A%2F%2Fdbpedia.org%2F%3E%0APREFIX+dbo%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E%0A%0ASELECT+DISTINCT+%3Fname+%3Fimage%0Awhere+%7B%0A%3FNamedIdividual+rdf%3Atype+%3Ftype.%0A%3Ftype+rdfs%3AsubClassOf*+am%3A";
const url_alatmusik1 =
    "+.%0A%3FNamedIdividual+rdfs%3Alabel+%3Fname+.++%0A%3FNamedIdividual+schema%3Aimage+%3Fimage+.%0A%7D+ORDER+BY+%3Fcategory+ASC(%3Fcategory)%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A++%0A%0A%0A%0A%0A%0A%0A%0A%0A";

const url_gambar_alatmusik = "https://app.alunalun.info/alatmusik/images/";
const url_detailasm_1 =
    "query?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0APREFIX+schema%3A+%3Chttp%3A%2F%2Fschema.org%2F%3E+%0APREFIX+%3A++++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+dbpedia-owl%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E+%0APREFIX+obda%3A++%3Chttps%3A%2F%2Fw3id.org%2Fobda%2Fvocabulary%23%3E+%0APREFIX+am1%3A+++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23am%3A%3E+%0APREFIX+PROV-O%3A+%3Chttp%3A%2F%2Fwww.w3.org%2Fns%2Fprov%23%3E+%0APREFIX+am%3A++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+foaf%3A++%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0APREFIX+upacara%3A+%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Fsenipertunjukan%23%3E%0APREFIX+db%3A+%3Chttp%3A%2F%2Fdbpedia.org%2F%3E%0APREFIX+dbo%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E%0A%0ASELECT+%3Fdescription+%3Fname+%3Fimage+%0A%3Fvideo+%3Fsumber+where%0A%7B%3FNamedIdividual+rdfs%3Alabel+%22";
const url_detailasm_2 =
    "%22+.+%0A%3FNamedIdividual+rdfs%3Alabel+%3Fname+.%0A%3FNamedIdividual+schema%3Aimage+%3Fimage+.%0A%3FNamedIdividual+am%3ADESCRIPTION+%3Fdescription+.+%0A%3FNamedIdividual+schema%3Avideo+%3Fvideo+.%0A%3FNamedIdividual+am%3ASUMBER+%3Fsumber+.%7D%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A++%0A%0A%0A%0A%0A%0A%0A%0A%0A";
const url_gambar_detail_alatmusik =
    "https://app.alunalun.info/alatmusik/images/";
const url_postSearching = "https://app.alunalun.info/fuseki/alatmusik/query?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0APREFIX+schema%3A+%3Chttp%3A%2F%2Fschema.org%2F%3E+%0APREFIX+%3A++++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+dbpedia-owl%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E+%0APREFIX+obda%3A++%3Chttps%3A%2F%2Fw3id.org%2Fobda%2Fvocabulary%23%3E+%0APREFIX+am1%3A+++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23am%3A%3E+%0APREFIX+PROV-O%3A+%3Chttp%3A%2F%2Fwww.w3.org%2Fns%2Fprov%23%3E+%0APREFIX+am%3A++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+foaf%3A++%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0APREFIX+upacara%3A+%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Fsenipertunjukan%23%3E+%0APREFIX+dbo%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E%0A%0A%0A+SELECT+%3Flabelclass+%3Flabel+%3Fimage+%3Flink+WHERE+%7B%7B+%3Fclass+rdfs%3AsubClassOf+am%3ACategory.%0A%09%09%09%09%3Fclass+rdfs%3Alabel+%3Flabelclass.%0A++++%09%09%09%3Findividual+rdf%3Atype+%3Fclass.%0A%09%09%09%09%3Findividual+rdfs%3Alabel+%3Flabel.%0A++++%09%09%09%3Findividual+schema%3Aimage+%3Fimage.%0A%09%09%09%09OPTIONAL+%7B+%3Findividual+dbo%3AwikiPageRevisionID+%3Flink+.%7D%0A++++%09%09%09FILTER+(regex(%3Flabelclass%2C+%22Perkusi%22%0A%09%09%09%09%2C+'i'))%7D+UNION+%7B+%3Fclass+rdfs%3AsubClassOf+am%3ACategory.%0A%09%09%09%09%3Fclass+rdfs%3Alabel+%3Flabelclass.+%3Findividual+rdf%3Atype+%3Fclass.%0A%09%09%09%09%3Findividual+am%3AhasBahanPembuat+%3Fbahan.%0A++++++++%09%09%3Fbahan+rdfs%3Alabel+%3Flabelbahan.%0A%09%09%09%09%3Findividual+rdfs%3Alabel+%3Flabel.+%3Findividual+schema%3Aimage+%3Fimage.%0A%09%09%09%09OPTIONAL+%7B+%3Findividual+dbo%3AwikiPageRevisionID+%3Flink+.%7D%0A++++++++%09%09FILTER+(regex(%3Flabelbahan%2C+%22Perunggu%22%0A%09%09%09%09%2C+'i'))+%7D+UNION+%7B+%3Fclass+rdfs%3AsubClassOf+am%3ACategory.%0A%09%09%09%09%3Fclass+rdfs%3Alabel+%3Flabelclass.+%3Findividual+rdf%3Atype+%3Fclass.%0A%09%09%09%09%3Findividual+am%3AhasKegunaan+%3Fkegunaan.+%3Fkegunaan+rdfs%3Alabel+%3Flabelkegunaan.%0A%09%09%09%09%3Findividual+rdfs%3Alabel+%3Flabel.%0A++++++++%09%09%3Findividual+schema%3Aimage+%3Fimage.%0A%09%09%09%09OPTIONAL+%7B+%3Findividual+dbo%3AwikiPageRevisionID+%3Flink+.%7D+FILTER+(regex(%3Flabelkegunaan%2C+%22Upacara+Sekaten%22%0A%09%09%09%09%2C+'i'))%7D+UNION+%7B+%3Fclass+rdfs%3AsubClassOf+am%3ACategory.%0A%09%09%09%09%3Fclass+rdfs%3Alabel+%3Flabelclass.%0A++++++++%09%09%3Findividual+rdf%3Atype+%3Fclass.%0A%09%09%09%09%3Findividual+am%3AhasDaerah+%3Fdaerah.%0A++++++++%09%09%3Fdaerah+rdfs%3Alabel+%3Flabeldaerah.%0A%09%09%09%09%3Findividual+rdfs%3Alabel+%3Flabel.%0A++++++++%09%09%3Findividual+schema%3Aimage+%3Fimage.%0A%09%09%09%09OPTIONAL+%7B+%3Findividual+dbo%3AwikiPageRevisionID+%3Flink+.%7D+%0A++++++++%09%09FILTER+(regex(%3Flabeldaerah%2C+%22Yogyakarta%22%0A%09%09%09%09%2C+'i'))%7DUNION+%7B+%3Findividual+rdfs%3AsubClassOf*+am%3ACategory.%0A%09%09%09%09%3Findividual+rdfs%3Alabel+%3Flabelclass.%0A++++++++%09%09%3Fsubject+a+%3Findividual.%0A%09%09%09%09%3Fsubject+rdfs%3Alabel+%3Flabel.%0A++++++++%09%09%3Fsubject+schema%3Aimage+%3Fimage.%0A%09%09%09%09OPTIONAL+%7B+%3Fsubject+dbo%3AwikiPageRevisionID+%3Flink+.%7D%0A++++++++%09%09FILTER+(regex(%3Flabel%2C+%22Bonang%22%0A%09%09%09%09%2C+'i'))%7D%7D+ORDER+BY+ASC(%3Flabel)%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A";
const url_daerah =
    "https://app.alunalun.info/fuseki/alatmusik/query?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0APREFIX+schema%3A+%3Chttp%3A%2F%2Fschema.org%2F%3E+%0APREFIX+%3A++++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+dbpedia-owl%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E+%0APREFIX+obda%3A++%3Chttps%3A%2F%2Fw3id.org%2Fobda%2Fvocabulary%23%3E+%0APREFIX+am1%3A+++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23am%3A%3E+%0APREFIX+PROV-O%3A+%3Chttp%3A%2F%2Fwww.w3.org%2Fns%2Fprov%23%3E+%0APREFIX+am%3A++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+foaf%3A++%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0APREFIX+upacara%3A+%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Fsenipertunjukan%23%3E%0APREFIX+db%3A+%3Chttp%3A%2F%2Fdbpedia.org%2F%3E%0APREFIX+dbo%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E%0A%0ASELECT+%3Flonglatprovince+%3Fnameprovince+%0A%3Flink+where%7B%3Fsubject+rdfs%3AsubClassOf+am%3ADaerah+.%0A%3FNamedIdividual+rdf%3Atype+%3Fsubject+.%0A%3FNamedIdividual+am%3ALONGLAT+%3Flonglatprovince+.%0A%3FNamedIdividual+dbo%3Alocation+%3Fnameprovince.%0A%3FNamedIdividual+dbo%3AwikiPageID+%3Flink+.%7D%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A++%0A%0A%0A%0A%0A%0A%0A%0A%0A";
const url_daerah1 =
    "https://app.alunalun.info/fuseki/alatmusik/query?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0APREFIX+schema%3A+%3Chttp%3A%2F%2Fschema.org%2F%3E+%0APREFIX+%3A++++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+dbpedia-owl%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E+%0APREFIX+obda%3A++%3Chttps%3A%2F%2Fw3id.org%2Fobda%2Fvocabulary%23%3E+%0APREFIX+am1%3A+++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23am%3A%3E+%0APREFIX+PROV-O%3A+%3Chttp%3A%2F%2Fwww.w3.org%2Fns%2Fprov%23%3E+%0APREFIX+am%3A++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+foaf%3A++%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0APREFIX+upacara%3A+%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Fsenipertunjukan%23%3E%0APREFIX+db%3A+%3Chttp%3A%2F%2Fdbpedia.org%2F%3E%0APREFIX+dbo%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E%0A%0ASELECT+%3Fdaerah+%3Flink+where%7B+%0A%3Fsubject+rdfs%3Alabel+%22Cangor%22+.%0A%3Fsubject+am%3AhasDaerah+%3Fobject+.%0A%3Fobject+dbo%3Alocation+%3Fdaerah.%0A%3Fobject+dbo%3AwikiPageID+%3Flink+.%7D%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A++%0A%0A%0A%0A%0A%0A%0A%0A%0A";
const url_kegunaan = "";
const url_kegunaan1 =
    "https://app.alunalun.info/fuseki/alatmusik/query?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0APREFIX+schema%3A+%3Chttp%3A%2F%2Fschema.org%2F%3E+%0APREFIX+%3A++++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+dbpedia-owl%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E+%0APREFIX+obda%3A++%3Chttps%3A%2F%2Fw3id.org%2Fobda%2Fvocabulary%23%3E+%0APREFIX+am1%3A+++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23am%3A%3E+%0APREFIX+PROV-O%3A+%3Chttp%3A%2F%2Fwww.w3.org%2Fns%2Fprov%23%3E+%0APREFIX+am%3A++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+foaf%3A++%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0APREFIX+upacara%3A+%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Fsenipertunjukan%23%3E%0APREFIX+db%3A+%3Chttp%3A%2F%2Fdbpedia.org%2F%3E%0APREFIX+dbo%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E%0A%0ASELECT+%3Fkegunaan+%3Flink+%0A%3Flabelclass+where%7B+%0A%3Fsubject+rdfs%3Alabel+%22Bonang%22+.%0A%3Fsubject+am%3AhasKegunaan+%3Fobject+.%0A%3Fobject+a+%3Fclass.%0A%3Fclass+rdfs%3Alabel+%3Flabelclass.%0A%3Fobject+rdfs%3Alabel+%3Fkegunaan.%0A%3Fobject+dbo%3AwikiPageRevisionID+%3Flink.%0A%7D+ORDER+BY+ASC(%3Flabelclass)%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A++%0A%0A%0A%0A%0A%0A%0A%0A%0A";
const url_bahan = "";
const url_bahan1 = "";
const url_index =
    "https://app.alunalun.info/fuseki/alatmusik/query?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0APREFIX+schema%3A+%3Chttp%3A%2F%2Fschema.org%2F%3E+%0APREFIX+%3A++++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+dbpedia-owl%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E+%0APREFIX+obda%3A++%3Chttps%3A%2F%2Fw3id.org%2Fobda%2Fvocabulary%23%3E+%0APREFIX+am1%3A+++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23am%3A%3E+%0APREFIX+PROV-O%3A+%3Chttp%3A%2F%2Fwww.w3.org%2Fns%2Fprov%23%3E+%0APREFIX+am%3A++++%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Falatmusik%23%3E+%0APREFIX+foaf%3A++%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0APREFIX+upacara%3A+%3Chttp%3A%2F%2Falunalun.info%2Fontology%2Fsenipertunjukan%23%3E%0APREFIX+db%3A+%3Chttp%3A%2F%2Fdbpedia.org%2F%3E%0APREFIX+dbo%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E%0A%0ASELECT+%3Findex+%0Awhere%7B%3FNamedIdividual+rdfs%3Alabel+%22Bonang%22+.%0A%3FNamedIdividual+am%3AINDEX+%3Findex+.%7D%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A++%0A%0A%0A%0A%0A%0A%0A%0A%0A";

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
