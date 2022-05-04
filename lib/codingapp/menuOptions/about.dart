import 'package:flutter/material.dart';

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
    Size screenSize = MediaQuery.of(context).size;

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
          padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                child: Text(
                  'About Page \n La Palma Volcano Eruption Tracking Tool ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  ',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'Learn more',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                '\nTo get to know more about Liquid Galaxy Projects you can check out their website and github. \n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              GestureDetector(
                onTap: () {
                  _launchURL('https://www.liquidgalaxy.eu/');
                },
                child: Text(
                  'Liquid Galaxy website \n',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchURL('https://github.com/LiquidGalaxyLAB/');
                },
                child: Text(
                  'Liquid Galaxy GitHub\n',
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
}
