import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';

import 'package:voltrac/codingapp/drawer.dart';
import 'package:voltrac/codingapp/layout.dart';
import 'package:voltrac/codingapp/theme.dart';
import 'package:provider/provider.dart';
import 'package:voltrac/codingapp/theme-storage.dart';
import 'package:feature_discovery/feature_discovery.dart';

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
                              child: DescribedFeatureOverlay(
                                  featureId:
                                      'feature12', // Unique id that identifies this overlay.
                                  tapTarget: Image.asset(
                                    themeNotifier.isDark
                                        ? 'assets/menu-white.png'
                                        : 'assets/menu.png',
                                    height: 36,
                                  ), // The widget that will be displayed as the tap target.
                                  overflowMode: OverflowMode.extendBackground,
                                  title: Text(
                                    translate("tour.app"),
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  description: Text(translate("tour.desc"),
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  targetColor: themeNotifier.isDark
                                      ? Color.fromARGB(255, 30, 30, 30)
                                      : Colors.white,
                                  textColor: themeNotifier.isDark
                                      ? Colors.white
                                      : Colors.black,
                                  child: IconButton(
                                      icon: Image.asset(themeNotifier.isDark
                                          ? 'assets/menu-white.png'
                                          : 'assets/menu.png'),
                                      iconSize: 120,
                                      onPressed: () {
                                        Scaffold.of(context).openEndDrawer();
                                      }))),
                        )
                      ],
                    ),
                  ),
                )),
      ),
      endDrawer: FeatureDiscovery(child: Drawers()),
      body: Layout(),
    );
  }

  @override
  void initState() {
    // ...
    SchedulerBinding.instance?.addPostFrameCallback((Duration duration) {
      FeatureDiscovery.discoverFeatures(
        context,
        const <String>{
          // Feature ids for every feature that you want to showcase in order.
          'feature12',
        },
      );
    });
    super.initState();
  }
}

class First extends StatelessWidget {
  First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) => FeatureDiscovery(
            child: MaterialApp(
                home: Mainpage(),
                theme: themeNotifier.isDark ? isDarkTheme : isLightTheme)));
  }
}
