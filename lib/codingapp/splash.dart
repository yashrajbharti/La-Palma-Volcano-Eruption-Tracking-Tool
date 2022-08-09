import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:webscrapperapp/codingapp/theme-storage.dart';
import 'package:webscrapperapp/codingapp/mainpage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) => SplashScreen(
              seconds: 3,
              navigateAfterSeconds: First(),
              title: Text(
                translate('title.name'),
                style: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 55,
                  color: Color.fromARGB(255, 204, 204, 204),
                ),
              ),
              image: Image.asset("assets/icons/volcanoandlogo.png"),
              backgroundColor: themeNotifier.isDark
                  ? Color.fromARGB(255, 16, 16, 16)
                  : Color.fromARGB(255, 30, 30, 30),
              photoSize: 150.0,
              loaderColor: const Color.fromARGB(255, 204, 204, 204),
            ));
  }
}
