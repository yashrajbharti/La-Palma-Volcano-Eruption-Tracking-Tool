import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:webscrapperapp/codingapp/drawer.dart';

class HelpScreen extends StatefulWidget {
  HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 50.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Drawers(),
                ),
              );
            },
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 204, 204, 204),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20, top: 50),
                child: Text(
                  translate("help.helppage"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      translate("help.instruction"),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  translate("help.points"),
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      translate("help.Troubleshooting"),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  translate("help.points2"),
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            translate("help.support"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              translate("help.check"),
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchURL('https://www.liquidgalaxy.eu/');
                            },
                            child: Text(
                              translate("help.website"),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 97, 146, 245)),
                            ),
                          ),
                          Text(
                            '\n',
                            style: TextStyle(fontSize: 4),
                            textAlign: TextAlign.start,
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchURL('https://github.com/LiquidGalaxyLAB/');
                            },
                            child: Text(
                              translate("help.github"),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 97, 146, 245)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 180,
                      child: VerticalDivider(
                        color: Color.fromARGB(120, 74, 74, 74),
                        thickness: 1,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            translate("help.icons"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              translate("help.meanings"),
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 15,
                              ),
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 75, 127, 82),
                                radius: 20,
                                child: Icon(
                                  Icons.map,
                                  size: 32.0,
                                  color: Color.fromARGB(255, 204, 204, 204),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.34,
                                child: Text(
                                  translate("help.switch"),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontFamily: "OldStandard"),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 15,
                              ),
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 75, 127, 82),
                                radius: 20,
                                child: Icon(
                                  Icons.gps_fixed_rounded,
                                  size: 32.0,
                                  color: Color.fromARGB(255, 204, 204, 204),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.34,
                                child: Text(
                                  translate("help.origin"),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontFamily: "OldStandard"),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
