import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';

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
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          color: isDarkTheme
              ? Color.fromARGB(255, 16, 16, 16)
              : Color.fromARGB(255, 204, 204, 204),
          child: Padding(
            padding: EdgeInsets.only(top: 30),

            // here the desired height
            child: AppBar(
              elevation: 0,
              title: Padding(
                // change left :
                padding: EdgeInsets.only(left: 120, top: 6),
                child: Text(
                  translate('title.name'),
                  style: TextStyle(
                    fontSize: 48,
                    color: isDarkTheme
                        ? Color.fromARGB(255, 204, 204, 204)
                        : Color.fromARGB(255, 16, 16, 16),
                  ),
                ),
              ),
              actions: [
                Builder(
                  builder: (context) => Padding(
                    // change left :
                    padding: const EdgeInsets.only(right: 30),
                    child: IconButton(
                      icon: Image.asset(isDarkTheme
                          ? 'assets/menu-white.png'
                          : 'assets/menu.png'),
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
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(color: myColour),
        scaffoldBackgroundColor: myColour,
        primarySwatch: myColour,
        fontFamily: 'OldStandard',
        textTheme: TextTheme(
          button: TextStyle(fontSize: 24.0),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(color: yourColour),
        scaffoldBackgroundColor: yourColour,
        primarySwatch: yourColour,
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
    50: Color.fromARGB(255, 204, 204, 204),
    100: Color.fromARGB(255, 204, 204, 204),
    200: Color.fromARGB(255, 204, 204, 204),
    300: Color.fromARGB(255, 204, 204, 204),
    400: Color.fromARGB(255, 204, 204, 204),
    500: Color.fromARGB(255, 204, 204, 204),
    600: Color.fromARGB(255, 204, 204, 204),
    700: Color.fromARGB(255, 204, 204, 204),
    800: Color.fromARGB(255, 204, 204, 204),
    900: Color.fromARGB(255, 204, 204, 204),
  },
);
const MaterialColor yourColour = const MaterialColor(
  0xFF101010,
  const <int, Color>{
    50: Color.fromARGB(255, 16, 16, 16),
    100: Color.fromARGB(255, 16, 16, 16),
    200: Color.fromARGB(255, 16, 16, 16),
    300: Color.fromARGB(255, 16, 16, 16),
    400: Color.fromARGB(255, 16, 16, 16),
    500: Color.fromARGB(255, 16, 16, 16),
    600: Color.fromARGB(255, 16, 16, 16),
    700: Color.fromARGB(255, 16, 16, 16),
    800: Color.fromARGB(255, 16, 16, 16),
    900: Color.fromARGB(255, 16, 16, 16),
  },
);
