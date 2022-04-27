import 'package:flutter/material.dart';
import 'package:webscrapperapp/codingapp/layout.dart';

import 'codingapp/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Scrapper",
      home: Layout(),
    );
  }
}
