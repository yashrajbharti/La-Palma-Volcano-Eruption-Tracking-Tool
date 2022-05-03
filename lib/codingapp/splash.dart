import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

import 'package:webscrapperapp/codingapp/mainpage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: First(),
      title: const Text(
        'La Palma Volcano Tracker',
        style: TextStyle(
          fontSize: 40,
          color: Color.fromARGB(255, 204, 204, 204),
        ),
      ),
      image: Image.asset("assets/volcano.png"),
      backgroundColor: const Color.fromARGB(255, 43, 43, 43),
      photoSize: 100.0,
      loaderColor: const Color.fromARGB(255, 204, 204, 204),
    );
  }
}
