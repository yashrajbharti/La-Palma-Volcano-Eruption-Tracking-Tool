import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VerticalCardPagerDemo extends StatefulWidget {
  @override
  _VerticalCardPagerDemoState createState() => _VerticalCardPagerDemoState();
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
              'Historic Track Map',
              style: TextStyle(color: Colors.white, fontSize: 37.5),
            ),
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
                        'Description:',
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
                        'This Track represents Lava Flow over the years on the La Palma island. Recorded history confirms these events, with the first volcanic activity in 1480 AD to the latest eruption from the Cumbre Vieja in 2021. Most of them have a Volcanic Explosivity Index (VEI) of 2, but the latest outbreak in 2021 had a VEI of 3.',
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.white70),
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
                        'Date of Event:',
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
                        'Various years between 1480 and 2021',
                        style: new TextStyle(
                          fontSize: 20.0,
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
                        'Legend:',
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
                    Text("Historical Lava Flow data of the following years:",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
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
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                          "1677 & 1971   ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                          "Lava symbol   ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                        'Sources:',
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
                              fontSize: 20,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
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
                              fontSize: 20,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
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
                              fontSize: 20,
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
              color: Colors.grey.withOpacity(0.5),
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
              'Lava Flow Map',
              style: TextStyle(color: Colors.white, fontSize: 37.5),
            ),
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
                        'Description:',
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
                        'The Lava Flow map represents Lava flow data from every 10-15 days. This data shows the evolution of Lava Flow, it\'s effect on the terrain, and the Lava Flow temperatures as it spreads in the La Palma region and finally reaches the sea. The lava flow rate was 10m/s, and the highest temperature of Lava was around 1270°C.',
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.white70),
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
                        'Date of Event:',
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
                        '24 September to 18 December, 2021',
                        style: new TextStyle(
                          fontSize: 20.0,
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
                        'Legend:',
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
                    Text(
                        "Legend for the evolution of Lava Flow data from September 2021 to December 2021:",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
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
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                          "Vents",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                        'Sources:',
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
                              fontSize: 20,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
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
                              fontSize: 20,
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
              color: Colors.grey.withOpacity(0.5),
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
              'Pre-Historic Map',
              style: TextStyle(color: Colors.white, fontSize: 37.5),
            ),
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
                        'Description:',
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
                        'These Volcanic activities are from the time in history before humankind wrote down events. Most of these are evident from Radiocarbon (uncorrected) and Potassium-Argon testing. The data is in Ka, which stands for kiloannus or kiloannum (ka), a unit of time equal to one thousand (10\u00B3) years.',
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.white70),
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
                        'Date of Event:',
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
                        'Various years in the range 6050 BCE ± 1500 years to 1480 ± 10 years',
                        style: new TextStyle(
                          fontSize: 20.0,
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
                        'Legend:',
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
                    Text(
                        "Pre-Historical Lava Flow data of the following calender years:",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
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
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                          "Lava symbol   ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                        'Sources:',
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
                              fontSize: 20,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
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
                              fontSize: 20,
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
              color: Colors.grey.withOpacity(0.5),
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
              'Affected Areas Map',
              style: TextStyle(color: Colors.white, fontSize: 37.5),
            ),
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
                        'Description:',
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
                        'This Track visualizes the data of the transportation facilities, houses, and buildings destroyed and possibly damaged and the harmful effect of lava on the natural lands and farms of the La Palma region.',
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.white70),
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
                        'Date of Event:',
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
                        'Situation of 15 December, 2021',
                        style: new TextStyle(
                          fontSize: 20.0,
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
                        'Legend:',
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
                    Text(
                        "Affected Areas data of Transportation, Built up, and Facilities grading:",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
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
                          "Destroyed  ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                          "Possibly Destroyed  ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/black_sq.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "No Visible Damage",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                        Text("Lava Flow ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OldStandard")),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/vent.png'),
                            iconSize: 38,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "Vents  ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontFamily: "OldStandard"),
                        ),
                        const Icon(
                          Icons.rectangle_outlined,
                          color: Color.fromARGB(255, 72, 188, 26),
                          size: 46,
                        ),
                        Text(
                          "Area of interest    ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          "▬▬  ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 3, 95, 171),
                              fontWeight: FontWeight.bold,
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          "Hydrography",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                              fontSize: 20.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          "Roads Destroyed  ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          "▬▬  ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 249, 233, 82),
                              fontWeight: FontWeight.bold,
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          "Possibly Destroyed  ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          "▬▬  ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          "No Visible Damage",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                        'Sources:',
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
                              fontSize: 20,
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
              color: Colors.grey.withOpacity(0.5),
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
              'Landscape Map',
              style: TextStyle(color: Colors.white, fontSize: 37.5),
            ),
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
                        'Description:',
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
                        'The Cumbre Vieja Volcanic activity of 2021 left a mark on the La Palma region. The Operational Land Imager (OLI) on Landsat 8 captured this natural-color image showing how drastically the Todoque and El Paraíso areas have changed as of 15 December, 2021.',
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.white70),
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
                        'Date of Event:',
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
                        '15 December, 2021',
                        style: new TextStyle(
                          fontSize: 20.0,
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
                        'Legend:',
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
                    Text(
                        "Legend for Changed landscape of La Palma due to Lava Flow:",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
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
                        Text("Landscape due to Lava Flow    ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                        Text("Info icon for Changed Landscape of La Palma    ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                        'Sources:',
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
                              fontSize: 20,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 20,
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
                              fontSize: 20,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 20,
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
                              fontSize: 20,
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
              color: Colors.grey.withOpacity(0.5),
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
              'SO\u2082 Emissions Map',
              style: TextStyle(color: Colors.white, fontSize: 37.5),
            ),
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
                        'Description:',
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
                        'Atmospheric Monitoring Service tracks sulfur dioxide plumes from the volcanic eruption on La Palma. La Palma volcano spews some 250,000 tons of Sulfur Dioxide (Data from INVOLCAN) that had traveled over Morocco and Spain and reached France periodically, bringing plumes northeast toward Europe.',
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.white70),
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
                        'Date of Event:',
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
                        '26 September, 2021',
                        style: new TextStyle(
                          fontSize: 20.0,
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
                        'Legend:',
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
                    Text(
                        "SO\u2082 Emissions data with measurements in mol per square meter (mol/ m\u00B2):",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
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
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.rectangle_rounded,
                          color: Color.fromARGB(255, 235, 56, 50),
                          size: 40,
                        ),
                        Text(" 8.75E - 3    ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.rectangle_rounded,
                          color: Color.fromARGB(255, 251, 248, 81),
                          size: 40,
                        ),
                        Text(" 6.25E - 3    ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.rectangle_rounded,
                          color: Color.fromARGB(255, 107, 248, 251),
                          size: 40,
                        ),
                        Text(" 3.75E - 3    ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.rectangle_rounded,
                          color: Color.fromARGB(255, 9, 35, 135),
                          size: 40,
                        ),
                        Text(" 0.0    ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OldStandard")),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/VO.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "Cumbre Vieja Volcano",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                        'Sources:',
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
                              fontSize: 20,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 20,
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
                              fontSize: 20,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 20,
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
                              fontSize: 20,
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
              color: Colors.grey.withOpacity(0.5),
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
              'Situation Map',
              style: TextStyle(color: Colors.white, fontSize: 37.5),
            ),
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
                        'Description:',
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
                        'This Track gives a situational analysis of the start of the volcanic eruption at La Palma. Spanish Civil Protection evacuated >6,000 people on 19th Sep. Lava Flow began on 20th Sep at 18:50 UTC, and IGN reported 180 Damaged houses.',
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.white70),
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
                        'Date of Event:',
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
                        '19 September, 2021 at 14.10 UTC (And Tremors between 11-21 September)',
                        style: new TextStyle(
                          fontSize: 20.0,
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
                        'Legend:',
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
                    Text("Legend for the Situational Overview:",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
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
                          "Main Eruptive Event   ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                          "Orange Alert  ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontFamily: "OldStandard"),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon6.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text("Maritime Exclusion Zone  ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                        Text("Closed Roads    ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OldStandard")),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon14.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                        Text(
                          "Lava Flow ",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          "  Text  ",
                          style: TextStyle(
                              fontSize: 23.0,
                              color: Color.fromARGB(255, 82, 61, 42),
                              fontWeight: FontWeight.bold,
                              fontFamily: "OldStandard"),
                        ),
                        Text(
                          "Municipalities under evacuation \norder / emergency declaration",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
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
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 247, 184, 68),
                          size: 20,
                        ),
                        Text(" 13-14  ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 239, 99, 55),
                          size: 20,
                        ),
                        Text(" 15-16  ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 167, 36, 33),
                          size: 20,
                        ),
                        Text(" 17-18  ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 98, 17, 15),
                          size: 20,
                        ),
                        Text(" 19  ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 124, 93, 30),
                          size: 20,
                        ),
                        Text(" 20  ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OldStandard")),
                        const Icon(
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 20,
                        ),
                        Text(" 21 Sep (Tremor data)",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                        'Sources:',
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
                              fontSize: 20,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 20,
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
                              fontSize: 20,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                            fontSize: 20,
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
                              fontSize: 20,
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
              color: Colors.grey.withOpacity(0.5),
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
              'Located Events Map',
              style: TextStyle(color: Colors.white, fontSize: 37.5),
            ),
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
                        'Description:',
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
                        'This Track shows the Earthquake data of the tremors that happened throughout the volcanic activity period, i.e., from September to December. Earthquake is measured in mbLg units, which is the Body Wave Magnitude using the Lg wave. The Earthquakes that happen throughout the volcanic activity and the lava flow are responsible for the Evolution of Terrain.',
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.white70),
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
                        'Date of Event:',
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
                        '12 September to 15 December, 2021',
                        style: new TextStyle(
                          fontSize: 20.0,
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
                        'Legend:',
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
                    Text(
                        "Legend for Categorization of the Seismic data based on the magnitude:",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontFamily: "OldStandard")),
                    SizedBox(
                      height: 8,
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
                        Text(" 0 - 2 mbLg   ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 247, 184, 68),
                          size: 20,
                        ),
                        Text(" 2 - 4 mbLg   ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                          Icons.circle_rounded,
                          color: Color.fromARGB(255, 239, 99, 55),
                          size: 20,
                        ),
                        Text(" 4 - 6 mbLg   ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                        'Sources:',
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
                              fontSize: 20,
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
              color: Colors.grey.withOpacity(0.5),
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
          scrollDirection: Axis.vertical,
          autoPlayInterval: const Duration(milliseconds: 5000),
          autoPlay: false,
        ),
        items: track_cards,
      )),
    );
  }
}
