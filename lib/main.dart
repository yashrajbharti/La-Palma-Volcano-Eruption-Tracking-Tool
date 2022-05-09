import 'package:flutter/material.dart';

import 'package:webscrapperapp/codingapp/splash.dart';

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
