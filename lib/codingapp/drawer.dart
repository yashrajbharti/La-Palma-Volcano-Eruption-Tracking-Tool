import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:voltrac/codingapp/mainpage.dart';
import 'package:voltrac/codingapp/menuOptions/help.dart';
import 'package:voltrac/codingapp/menuOptions/lg_tasks.dart';
import 'package:voltrac/codingapp/menuOptions/custom_builder.dart';
import 'package:voltrac/codingapp/menuOptions/settings.dart';
import 'package:voltrac/codingapp/menuOptions/about.dart';
import 'package:voltrac/codingapp/day_night_switch.dart';
import 'package:provider/provider.dart';
import 'package:voltrac/codingapp/theme-storage.dart';
import 'package:feature_discovery/feature_discovery.dart';

class Drawers extends StatefulWidget {
  Drawers({Key? key}) : super(key: key);

  @override
  State<Drawers> createState() => _DrawersState();
}

const dayColor = Color(0xFFd56352);
const nightColor = Color(0xFF1b1e23);

class _DrawersState extends State<Drawers> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 1.0,
          child: Consumer<ThemeModel>(
              builder: (context, ThemeModel themeNotifier, child) => Drawer(
                      child: Container(
                    color: themeNotifier.isDark
                        ? Color.fromARGB(255, 16, 16, 16)
                        : Color.fromARGB(255, 204, 204, 204),
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 1.0,
                    child: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(left: 100),
                        children: [
                          DrawerHeader(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                                  child: Text(
                                    translate("drawer.menu"),
                                    style: TextStyle(
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 46),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 36, 65),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0.0,
                                          shadowColor: Colors.transparent,
                                          primary: themeNotifier.isDark
                                              ? Color.fromARGB(255, 16, 16, 16)
                                              : Color.fromARGB(
                                                  255, 204, 204, 204),
                                          padding: EdgeInsets.all(15)),
                                      child: Icon(
                                        Icons.clear_rounded,
                                        color: themeNotifier.isDark
                                            ? Color.fromARGB(255, 204, 204, 204)
                                            : Color.fromARGB(255, 84, 84, 84),
                                        size: 60,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                First(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                              title: DescribedFeatureOverlay(
                                  featureId: 'feature3',
                                  // Unique id that identifies this overlay.
                                  tapTarget: Icon(
                                    Icons.help,
                                    size: 60,
                                  ), // The widget that will be displayed as the tap target.
                                  title: Text(
                                    translate("drawer.help"),
                                    style: TextStyle(
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 30),
                                    // )
                                  ),
                                  description: Text(translate("tour.help"),
                                      style: TextStyle(
                                          color: themeNotifier.isDark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 18)),
                                  backgroundColor:
                                      Color.fromARGB(255, 125, 164, 243),
                                  targetColor: themeNotifier.isDark
                                      ? Color.fromARGB(255, 30, 30, 30)
                                      : Colors.white,
                                  textColor: themeNotifier.isDark
                                      ? Colors.white
                                      : Colors.black,
                                  child: Text(
                                    translate("drawer.help"),
                                    style: TextStyle(
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 40),
                                    // )
                                  )),
                              onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HelpScreen(),
                                    ),
                                  )),
                          SizedBox(height: 24),
                          ListTile(
                              title: DescribedFeatureOverlay(
                                  featureId:
                                      'feature4', // Unique id that identifies this overlay.
                                  tapTarget: Icon(
                                    Icons.info_rounded,
                                    size: 60,
                                  ), // The widget that will be displayed as the tap target.
                                  title: Text(
                                    translate("drawer.about"),
                                    style: TextStyle(
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 30),
                                    // )
                                  ),
                                  description: Text(translate("tour.about"),
                                      style: TextStyle(
                                          color: themeNotifier.isDark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 18)),
                                  backgroundColor:
                                      Color.fromARGB(255, 125, 164, 243),
                                  targetColor: themeNotifier.isDark
                                      ? Color.fromARGB(255, 30, 30, 30)
                                      : Colors.white,
                                  textColor: themeNotifier.isDark
                                      ? Colors.white
                                      : Colors.black,
                                  child: Text(
                                    translate("drawer.about"),
                                    style: TextStyle(
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 40),
                                    // )
                                  )),
                              onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AboutScreen(),
                                    ),
                                  )),
                          SizedBox(height: 24),
                          ListTile(
                              title: DescribedFeatureOverlay(
                                  featureId:
                                      'feature5', // Unique id that identifies this overlay.
                                  tapTarget: Icon(
                                    Icons.calendar_month_rounded,
                                    size: 60,
                                  ), // The widget that will be displayed as the tap target.
                                  title: Text(
                                    translate("drawer.custom"),
                                    style: TextStyle(
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 30),
                                  ),
                                  description: Text(translate("tour.custom"),
                                      style: TextStyle(
                                          color: themeNotifier.isDark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 18)),
                                  backgroundColor:
                                      Color.fromARGB(255, 125, 164, 243),
                                  targetColor: themeNotifier.isDark
                                      ? Color.fromARGB(255, 30, 30, 30)
                                      : Colors.white,
                                  textColor: themeNotifier.isDark
                                      ? Colors.white
                                      : Colors.black,
                                  child: Text(
                                    translate("drawer.custom"),
                                    style: TextStyle(
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 40),
                                  )),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CustomBuilder(),
                                  ),
                                );
                              }),
                          SizedBox(height: 24),
                          ListTile(
                              title: DescribedFeatureOverlay(
                                  featureId:
                                      'feature6', // Unique id that identifies this overlay.
                                  tapTarget: Icon(
                                    Icons.construction_rounded,
                                    size: 60,
                                  ), // The widget that will be displayed as the tap target.
                                  title: Text(
                                    translate("drawer.task"),
                                    style: TextStyle(
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 30),
                                  ),
                                  description: Text(translate("tour.task"),
                                      style: TextStyle(
                                          color: themeNotifier.isDark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 18)),
                                  backgroundColor:
                                      Color.fromARGB(255, 125, 164, 243),
                                  targetColor: themeNotifier.isDark
                                      ? Color.fromARGB(255, 30, 30, 30)
                                      : Colors.white,
                                  textColor: themeNotifier.isDark
                                      ? Colors.white
                                      : Colors.black,
                                  child: Text(
                                    translate("drawer.task"),
                                    style: TextStyle(
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 40),
                                  )),
                              onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LGtasks(),
                                    ),
                                  )),
                          SizedBox(height: 24),
                          ListTile(
                              title: DescribedFeatureOverlay(
                                  featureId:
                                      'feature7', // Unique id that identifies this overlay.
                                  tapTarget: Icon(
                                    Icons.settings,
                                    size: 60,
                                  ), // The widget that will be displayed as the tap target.
                                  title: Text(
                                    translate("drawer.settings"),
                                    style: TextStyle(
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 30),
                                  ),
                                  description: Text(translate("tour.settings"),
                                      style: TextStyle(
                                          color: themeNotifier.isDark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 18)),
                                  backgroundColor:
                                      Color.fromARGB(255, 125, 164, 243),
                                  targetColor: themeNotifier.isDark
                                      ? Color.fromARGB(255, 30, 30, 30)
                                      : Colors.white,
                                  textColor: themeNotifier.isDark
                                      ? Colors.white
                                      : Colors.black,
                                  child: Text(
                                    translate("drawer.settings"),
                                    style: TextStyle(
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 40),
                                  )),
                              onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Settings(),
                                    ),
                                  )),
                          Container(
                            margin: EdgeInsets.only(right: 100),
                            padding: EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DayNightSwitch(
                                  value: themeNotifier.isDark
                                      ? val = true
                                      : val = false,
                                  moonImage: AssetImage('assets/moon.png'),
                                  sunImage: AssetImage('assets/sun.png'),
                                  sunColor: Colors.transparent,
                                  moonColor: Colors.transparent,
                                  dayColor: dayColor,
                                  nightColor: nightColor,
                                  onChanged: (value) {
                                    setState(() {
                                      val =
                                          themeNotifier.isDark ? value : !value;
                                    });
                                    themeNotifier.isDark
                                        ? themeNotifier.isDark = false
                                        : themeNotifier.isDark = true;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ]),
                  )))),
      Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) => Positioned(
              bottom: 30,
              right: 30,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    shadowColor: themeNotifier.isDark
                        ? Colors.black
                        : Colors.grey.withOpacity(0.5),
                    primary: Color.fromARGB(255, 125, 164, 243),
                    padding: EdgeInsets.all(15),
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    FeatureDiscovery.clearPreferences(
                      context,
                      const <String>{
                        'feature3',
                        'feature4',
                        'feature5',
                        'feature6',
                        'feature7'
                      },
                    ).then((value) => FeatureDiscovery.discoverFeatures(
                          context,
                          const <String>{
                            'feature3',
                            'feature4',
                            'feature5',
                            'feature6',
                            'feature7'
                          },
                        ));
                  },
                  child: DefaultTextStyle(
                      style: TextStyle(
                          fontSize: 30,
                          color: themeNotifier.isDark
                              ? Colors.white
                              : Colors.black,
                          fontFamily: "GoogleSans"),
                      child: Text(translate("tour.take")))))),
    ]);
  }
}
