// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

import 'package:webscrapperapp/codingapp/drawer.dart';
import 'package:webscrapperapp/codingapp/layout.dart';

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
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          color: Color.fromARGB(255, 204, 204, 204),
          child: Padding(
            padding: EdgeInsets.only(top: 30),

            // here the desired height
            child: AppBar(
              elevation: 0,
              title: const Padding(
                // change left :
                padding: EdgeInsets.only(left: 120),
                child: Text(
                  "La Palma Volcano Tracker",
                  style: TextStyle(
                    fontSize: 50,
                    color: Color.fromARGB(255, 0, 0, 0),
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
                      iconSize: 120,
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
      theme: ThemeData(
        scaffoldBackgroundColor: myColour,
        primarySwatch: myColour,
        fontFamily: 'OldStandard',
        textTheme: TextTheme(
          button: TextStyle(fontSize: 24.0),
        ),
      ),
      home: Mainpage(),
    );
  }
}

const MaterialColor myColour = const MaterialColor(
  0xFFCCCCCC,
  const <int, Color>{
    50: const Color.fromARGB(255, 204, 204, 204),
    100: const Color.fromARGB(255, 204, 204, 204),
    200: const Color.fromARGB(255, 204, 204, 204),
    300: const Color.fromARGB(255, 204, 204, 204),
    400: const Color.fromARGB(255, 204, 204, 204),
    500: const Color.fromARGB(255, 204, 204, 204),
    600: const Color.fromARGB(255, 204, 204, 204),
    700: const Color.fromARGB(255, 204, 204, 204),
    800: Color.fromARGB(255, 204, 204, 204),
    900: Color.fromARGB(255, 204, 204, 204),
  },
);
