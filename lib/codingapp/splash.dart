import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

import 'package:webscrapperapp/codingapp/mainpage.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: First(),
      title: Text('scrapping tool'),
      styleTextUnderTheLoader: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      image: Image.asset("assets/pin.png"),
      backgroundColor: Colors.black,
      photoSize: 100.0,
      loaderColor: Colors.white,
    );
  }
}
