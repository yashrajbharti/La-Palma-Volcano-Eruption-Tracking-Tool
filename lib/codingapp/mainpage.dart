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
      appBar: AppBar(
        title: Text("La Palmas App"),
      ),
      drawer: Drawers(),
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
