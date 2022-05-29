import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:webscrapperapp/codingapp/drawer.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
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
          padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                child: Text(
                  translate("About.aboutpage"),
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
                      translate("About.all"),
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
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Linkify(
                  onOpen: _onOpen,
                  text: translate("About.points"),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  linkStyle: TextStyle(color: Colors.black, fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ),
              Text(
                translate("About.learn"),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  translate("About.check"),
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchURL('https://github.com/LiquidGalaxyLAB/VolTrac');
                },
                child: Text(
                  translate("About.github"),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
              Text(
                '\n',
                style: TextStyle(fontSize: 4),
                textAlign: TextAlign.start,
              ),
              GestureDetector(
                onTap: () {
                  _launchURL(
                      'https://github.com/LiquidGalaxyLAB/VolTrac/Privacy_Policy.md');
                },
                child: Text(
                  translate("About.privacy"),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}
