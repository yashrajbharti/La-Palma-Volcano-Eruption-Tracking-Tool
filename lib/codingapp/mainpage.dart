import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';

import 'package:webscrapperapp/codingapp/drawer.dart';
import 'package:webscrapperapp/codingapp/layout.dart';
import 'package:webscrapperapp/codingapp/theme.dart';
import 'package:provider/provider.dart';
import 'package:webscrapperapp/codingapp/theme-storage.dart';

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
        child: Consumer<ThemeModel>(
            builder: (context, ThemeModel themeNotifier, child) => Container(
                  color: themeNotifier.isDark
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
                            color: themeNotifier.isDark
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
                              icon: Image.asset(themeNotifier.isDark
                                  ? 'assets/menu-white.png'
                                  : 'assets/menu.png'),
                              iconSize: 120,
                              onPressed: () =>
                                  Scaffold.of(context).openEndDrawer(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
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
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) => MaterialApp(
            home: Mainpage(),
            theme: themeNotifier.isDark ? isDarkTheme : isLightTheme));
  }
}
