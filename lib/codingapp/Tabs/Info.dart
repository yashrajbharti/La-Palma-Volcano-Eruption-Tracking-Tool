import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';
import 'package:url_launcher/url_launcher.dart';

class VerticalCardPagerDemo extends StatefulWidget {
  @override
  _VerticalCardPagerDemoState createState() => _VerticalCardPagerDemoState();
}

int x = 0;
void jumpToPage(int page) {
  x = page;
}

class _VerticalCardPagerDemoState extends State<VerticalCardPagerDemo> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> track_cards = [
      // Historical Track
      Container(
        margin: EdgeInsets.fromLTRB(90, 0, 90, 0),
        padding: EdgeInsets.only(top: 20),
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              translate('Track.hist'),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34.5,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.info_outline_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.description"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.hist.description"),
                        style: new TextStyle(
                            fontSize: 18.5, color: Colors.white70),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.calendar_month_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.date"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.hist.date"),
                        style: new TextStyle(
                          fontSize: 18.5,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child:
                        Icon(Icons.map_sharp, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.legend"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                flex: 9,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(translate("info.hist.legend"),
                        style: TextStyle(
                            fontSize: 18.5,
                            color: Colors.white70,
                            fontFamily: "OldStandard")),
                    SizedBox(
                      height: 8,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon8.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text("1480    ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon7.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "1585   ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon2.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "1646   ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon1.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          translate("info.hist.and"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon6.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text("1712    ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon4.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "1949   ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon3.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "1949   ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon5.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "2021   ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/molten.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          translate("info.hist.lava"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.link, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.sources"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://emergency.copernicus.eu/mapping/list-of-components/EMSR546/ALL/EMSR546_AOI01');
                        },
                        child: const Text(
                          'COPERNICUS',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18.5,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                          fontSize: 18.5,
                          color: Colors.white70,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://www.researchgate.net/publication/284812060_The_magma_plumbing_system_for_the_1971_Teneguia_eruption_on_La_Palma_Canary_Islands/figures?lo=1');
                        },
                        child: const Text(
                          'ResearchGate',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18.5,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                          fontSize: 18.5,
                          color: Colors.white70,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://volcano.si.edu/volcano.cfm?vn=383010');
                        },
                        child: const Text(
                          'Global Volcanism Program',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18.5,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
        ]),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 125, 164, 243),
          border: Border.all(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.0),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),

      // Lava Flow Track
      Container(
        margin: EdgeInsets.fromLTRB(90, 0, 90, 0),
        padding: EdgeInsets.only(top: 20),
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              translate('Track.lava'),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34.5,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.info_outline_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.description"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.lava.description"),
                        style: new TextStyle(
                            fontSize: 18.5, color: Colors.white70),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.calendar_month_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.date"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.lava.date"),
                        style: new TextStyle(
                          fontSize: 18.5,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child:
                        Icon(Icons.map_sharp, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.legend"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                flex: 9,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(translate("info.lava.legend"),
                        style: TextStyle(
                            fontSize: 18.5,
                            color: Colors.white70,
                            fontFamily: "OldStandard")),
                    SizedBox(
                      height: 8,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon6.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text("24 Sep    ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon2.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "8 Oct   ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon1.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "21 Oct   ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon9.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "4 Nov   ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon10.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text("14 Nov    ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon7.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "21 Nov   ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon11.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "1 Dec   ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon12.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "18 Dec   ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/vent.png'),
                            iconSize: 36,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          translate("info.lava.vents"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.link, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.sources"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://emergency.copernicus.eu/mapping/list-of-components/EMSR546/ALL/EMSR546_AOI01');
                        },
                        child: const Text(
                          'COPERNICUS',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18.5,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                          fontSize: 18.5,
                          color: Colors.white70,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://en.wikipedia.org/wiki/2021_Cumbre_Vieja_volcanic_eruption');
                        },
                        child: const Text(
                          'Wikipedia | Cumbre Vieja',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18.5,
                            color: Colors.white70,
                          ),
                        ),
                      )
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
        ]),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 125, 164, 243),
          border: Border.all(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.0),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
      // Pre-historic Track
      Container(
        margin: EdgeInsets.fromLTRB(90, 0, 90, 0),
        padding: EdgeInsets.only(top: 20),
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              translate('Track.prehistoric'),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34.5,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.info_outline_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.description"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.prehistoric.description"),
                        style: new TextStyle(
                            fontSize: 18.5, color: Colors.white70),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.calendar_month_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.date"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.prehistoric.date"),
                        style: new TextStyle(
                          fontSize: 18.5,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child:
                        Icon(Icons.map_sharp, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.legend"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                flex: 9,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(translate("info.prehistoric.legend"),
                        style: TextStyle(
                            fontSize: 18.5,
                            color: Colors.white70,
                            fontFamily: "OldStandard")),
                    SizedBox(
                      height: 8,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon9.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text("6 ± 2 Ka    ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon7.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "3.2 ± 0.1 Ka   ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon11.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "3.2 ± 0.1 Ka   ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon4.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text("1.04 ± 0.009    ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon6.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "1480 AD   ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/molten.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          translate("info.prehistoric.lava"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.link, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.sources"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://www.researchgate.net/publication/284812060_The_magma_plumbing_system_for_the_1971_Teneguia_eruption_on_La_Palma_Canary_Islands/figures?lo=1');
                        },
                        child: const Text(
                          'ResearchGate',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18.5,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                          fontSize: 18.5,
                          color: Colors.white70,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://volcano.si.edu/volcano.cfm?vn=383010');
                        },
                        child: const Text(
                          'Global Volcanism Program',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18.5,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
        ]),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 125, 164, 243),
          border: Border.all(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.0),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
      // Affected Areas Track
      Container(
        margin: EdgeInsets.fromLTRB(90, 0, 90, 0),
        padding: EdgeInsets.only(top: 20),
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              translate('Track.aff'),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34.5,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.info_outline_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.description"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.aff.description"),
                        style: new TextStyle(
                            fontSize: 18.5, color: Colors.white70),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.calendar_month_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.date"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.aff.date"),
                        style: new TextStyle(
                          fontSize: 18.5,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child:
                        Icon(Icons.map_sharp, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.legend"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                flex: 9,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(translate("info.aff.legend"),
                        style: TextStyle(
                            fontSize: 18.5,
                            color: Colors.white70,
                            fontFamily: "OldStandard")),
                    SizedBox(
                      height: 8,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/red.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          translate("info.aff.destroyed"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/yellow_sq.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          translate("info.aff.possible"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon6.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(translate("info.aff.lava"),
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/vent.png'),
                            iconSize: 38,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          translate("info.aff.vents"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        const Icon(
                          Icons.rectangle_outlined,
                          color: Color.fromARGB(255, 72, 188, 26),
                          size: 46,
                        ),
                        Text(
                          translate("info.aff.area"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          "▬▬  ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Color.fromARGB(255, 3, 95, 171),
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          translate("info.aff.hydro"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "▬▬  ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.red,
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          translate("info.aff.roads"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          "▬▬  ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Color.fromARGB(255, 249, 233, 82),
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          translate("info.aff.possible"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          "▬▬  ",
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          translate("info.aff.novisible"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.link, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.sources"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://emergency.copernicus.eu/mapping/list-of-components/EMSR546/ALL/EMSR546_AOI01');
                        },
                        child: const Text(
                          'COPERNICUS',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
        ]),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 125, 164, 243),
          border: Border.all(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.0),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
      // Landscape Track
      Container(
        margin: EdgeInsets.fromLTRB(90, 0, 90, 0),
        padding: EdgeInsets.only(top: 20),
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              translate('Track.land'),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34.5,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.info_outline_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.description"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate('info.land.description'),
                        style: new TextStyle(
                            fontSize: 18.5, color: Colors.white70),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.calendar_month_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.date"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate('info.land.date'),
                        style: new TextStyle(
                          fontSize: 18.5,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child:
                        Icon(Icons.map_sharp, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.legend"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                flex: 9,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(translate('info.land.legend'),
                        style: TextStyle(
                            fontSize: 18.5,
                            color: Colors.white70,
                            fontFamily: "OldStandard")),
                    SizedBox(
                      height: 8,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon13.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(translate('info.land.landscape'),
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/info.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(translate('info.land.infoicon'),
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                      ],
                    ),
                  ],
                ),
              ),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.link, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.sources"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://earthobservatory.nasa.gov/images/149231/a-changed-landscape-on-la-palma?src=eoa-iotd');
                        },
                        child: const Text(
                          'NASA Earth Observatory',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 18.5,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://apps.sentinel-hub.com/sentinel-playground/?source=S2&lat=28.641033254756742&lng=-17.935867309570312&zoom=12&preset=1-NATURAL-COLOR&layers=B01,B02,B03&maxcc=36&gain=1.0&gamma=1.0&time=2021-06-01%7C2021-12-29&atmFilter=&showDates=false');
                        },
                        child: const Text(
                          'Sentinel Playground',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 18.5,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://emergency.copernicus.eu/mapping/list-of-components/EMSR546/ALL/EMSR546_AOI01');
                        },
                        child: const Text(
                          'COPERNICUS',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
        ]),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 125, 164, 243),
          border: Border.all(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.0),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
      // SO2 Emissions Track
      Container(
        margin: EdgeInsets.fromLTRB(90, 0, 90, 0),
        padding: EdgeInsets.only(top: 20),
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              translate('Track.So2'),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34.5,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.info_outline_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.description"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.So2.description"),
                        style: new TextStyle(
                            fontSize: 18.5, color: Colors.white70),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.calendar_month_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.date"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.So2.date"),
                        style: new TextStyle(
                          fontSize: 18.5,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child:
                        Icon(Icons.map_sharp, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.legend"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                flex: 9,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(translate("info.So2.legend"),
                        style: TextStyle(
                            fontSize: 18.5,
                            color: Colors.white70,
                            fontFamily: "OldStandard")),
                    SizedBox(
                      height: 10,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.rectangle_rounded,
                          color: Color.fromARGB(255, 148, 32, 28),
                          size: 40,
                        ),
                        Text(" 1E - 2    ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.rectangle_rounded,
                          color: Color.fromARGB(255, 235, 56, 50),
                          size: 40,
                        ),
                        Text(" 8.75E - 3    ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.rectangle_rounded,
                          color: Color.fromARGB(255, 251, 248, 81),
                          size: 40,
                        ),
                        Text(" 6.25E - 3    ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.rectangle_rounded,
                          color: Color.fromARGB(255, 107, 248, 251),
                          size: 40,
                        ),
                        Text(" 3.75E - 3    ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.rectangle_rounded,
                          color: Color.fromARGB(255, 29, 71, 246),
                          size: 40,
                        ),
                        Text(" 1.25E - 3    ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.rectangle_rounded,
                          color: Color.fromARGB(255, 9, 35, 135),
                          size: 40,
                        ),
                        Text(" 0.0    ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/VO.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          translate("info.So2.volcano"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.link, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.sources"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://apps.sentinel-hub.com/eo-browser/?zoom=8&lat=26.79465&lng=-18.25928&themeId=DEFAULT-THEME&visualizationUrl=https%3A%2F%2Fservices.sentinel-hub.com%2Fogc%2Fwms%2F2c5dc5f7-4c83-40dd-a520-da2c7221568d&datasetId=S5_SO2&fromTime=2021-09-21T00%3A00%3A00.000Z&toTime=2021-09-21T23%3A59%3A59.999Z&layerId=SO2_VISUALIZED');
                        },
                        child: const Text(
                          'Sentinel EO Browser',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 18.5,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://www.gdacs.org/report.aspx?eventtype=VO&eventid=1000031');
                        },
                        child: const Text(
                          'GDACS',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 18.5,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://twitter.com/wmo/status/1442442516536696832');
                        },
                        child: const Text(
                          'Twitter | Platform ADAM',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
        ]),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 125, 164, 243),
          border: Border.all(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.0),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
      // Situation Track
      Container(
        margin: EdgeInsets.fromLTRB(90, 0, 90, 0),
        padding: EdgeInsets.only(top: 20),
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              translate('Track.situation'),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34.5,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.info_outline_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.description"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.situation.description"),
                        style: new TextStyle(
                            fontSize: 18.5, color: Colors.white70),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.calendar_month_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.date"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.situation.date"),
                        style: new TextStyle(
                          fontSize: 18.5,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child:
                        Icon(Icons.map_sharp, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.legend"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                flex: 9,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(translate("info.situation.legend"),
                        style: TextStyle(
                            fontSize: 18.5,
                            color: Colors.white70,
                            fontFamily: "OldStandard")),
                    SizedBox(
                      height: 5,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset(
                                'assets/icons/main_eruptive_event.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          translate("info.situation.main"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/VO.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          translate("info.situation.orange"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon6.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(translate("info.situation.maritime"),
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/close.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(translate("info.situation.closed"),
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon14.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          translate("info.situation.lava"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          translate("info.situation.Text"),
                          style: TextStyle(
                              fontSize: 23.0,
                              color: Color.fromARGB(255, 132, 95, 55),
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          translate("info.situation.municipality"),
                          style: TextStyle(
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontFamily: "OldStandard"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 255, 248, 82),
                          size: 20,
                        ),
                        Text(" 11-12  ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 247, 184, 68),
                          size: 20,
                        ),
                        Text(" 13-14  ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 239, 99, 55),
                          size: 20,
                        ),
                        Text(" 15-16  ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 167, 36, 33),
                          size: 20,
                        ),
                        Text(" 17-18  ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 98, 17, 15),
                          size: 20,
                        ),
                        Text(" 19  ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 124, 93, 30),
                          size: 20,
                        ),
                        Text(" 20  ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 20,
                        ),
                        Text(translate("info.situation.data"),
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                      ],
                    ),
                  ],
                ),
              ),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.link, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.sources"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://www.ign.es/web/ign/portal/sis-catalogo-terremotos');
                        },
                        child: const Text(
                          'Instituto Geográfico Nacional',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 18.5,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://www.gdacs.org/report.aspx?eventid=1000031&episodeid=2&eventtype=VO');
                        },
                        child: const Text(
                          'GDACS',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 18.5,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://erccportal.jrc.ec.europa.eu/ECHO-Products/Maps#/maps/3850');
                        },
                        child: const Text(
                          'ERCC Portal',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
        ]),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 125, 164, 243),
          border: Border.all(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.0),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
      // Located Events Track
      Container(
        margin: EdgeInsets.fromLTRB(90, 0, 90, 0),
        padding: EdgeInsets.only(top: 20),
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              translate('Track.located'),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34.5,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.info_outline_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.description"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.located.description"),
                        style: new TextStyle(
                            fontSize: 18.5, color: Colors.white70),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.calendar_month_rounded,
                        color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.date"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.located.date"),
                        style: new TextStyle(
                          fontSize: 18.5,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child:
                        Icon(Icons.map_sharp, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.legend"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                flex: 9,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(translate("info.located.legend"),
                        style: TextStyle(
                            fontSize: 18.5,
                            color: Colors.white70,
                            fontFamily: "OldStandard")),
                    SizedBox(
                      height: 8,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 255, 248, 82),
                          size: 20,
                        ),
                        Text(" 0 - 2 mbLg   ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 247, 184, 68),
                          size: 20,
                        ),
                        Text(" 2 - 3 mbLg   ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 239, 99, 55),
                          size: 20,
                        ),
                        Text(" 3 - 4 mbLg   ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Transform.scale(
                            scale: 1.2,
                            child: Transform.rotate(
                              angle: 23.55,
                              child: const Icon(
                                Icons.play_arrow,
                                color: Color.fromARGB(255, 141, 199, 255),
                                size: 30,
                              ),
                            )),
                        Text("5 - 6 mbLg   ",
                            style: TextStyle(
                                fontSize: 18.5,
                                color: Colors.white70,
                                fontFamily: "OldStandard")),
                      ],
                    ),
                  ],
                ),
              ),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(
                  left: 70.0,
                  right: 10.0,
                ),
                child: ClipRRect(
                  child: Container(
                    color: Color.fromARGB(255, 125, 164, 243),
                    child: Icon(Icons.link, color: Colors.white, size: 36.0),
                  ),
                ),
              ),
              new Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        translate("info.sources"),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              new Expanded(
                  flex: 9,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://www.ign.es/web/resources/sismologia/tproximos/prox.html#');
                        },
                        child: const Text(
                          'Instituto Geográfico Nacional',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18.5,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
              new Padding(
                  padding: new EdgeInsets.only(
                right: 70.0,
              )),
            ],
          ),
        ]),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 125, 164, 243),
          border: Border.all(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.0),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          height: 700,
          initialPage: x,
          scrollDirection: Axis.vertical,
          autoPlayInterval: const Duration(milliseconds: 5000),
          autoPlay: false,
        ),
        items: track_cards,
      )),
    );
  }
}
