import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:webscrapperapp/codingapp/layout.dart';
import 'package:webscrapperapp/codingapp/mainpage.dart';
import 'package:webscrapperapp/codingapp/splash.dart';

import 'codingapp/Tabs/Info_Tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Scrapper",
      home: Splash(),
    );
  }
}
