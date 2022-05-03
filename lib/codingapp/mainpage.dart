import 'package:flutter/material.dart';

import 'package:webscrapperapp/codingapp/drawer.dart';
import 'package:webscrapperapp/codingapp/layout.dart';
import 'package:webscrapperapp/codingapp/splash.dart';

class Mainpage extends StatefulWidget {
  Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // here the desired height
          child: AppBar(
            title: const Padding(
              // change left :
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "La Palma Volcano Tracker",
                style: TextStyle(
                  fontSize: 70,
                  color: Color.fromARGB(255, 204, 204, 204),
                ),
              ),
            ),
            actions: [
              Builder(
                builder: (context) => Padding(
                  // change left :
                  padding: const EdgeInsets.only(right: 30),
                  child: IconButton(
                    icon: Image.asset('assets/menu.png'),
                    iconSize: 70,
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
                ),
              ),
            ],
          )),
      endDrawer: const Drawers(),
      body: Layout(),
    );
  }
}

class First extends StatelessWidget {
  First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      home: Mainpage(),
    );
  }
}
