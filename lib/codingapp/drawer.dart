import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';
import 'package:webscrapperapp/codingapp/mainpage.dart';
import 'package:webscrapperapp/codingapp/menuOptions/help.dart';
import 'package:webscrapperapp/codingapp/menuOptions/lg_tasks.dart';
import 'package:webscrapperapp/codingapp/menuOptions/custom_builder.dart';
import 'package:webscrapperapp/codingapp/menuOptions/settings.dart';
import 'package:webscrapperapp/codingapp/menuOptions/about.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:webscrapperapp/codingapp/day_night_switch.dart';
import 'package:provider/provider.dart';
import 'package:webscrapperapp/codingapp/theme-storage.dart';

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
    return SizedBox(
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
                            title: Text(
                              translate("drawer.help"),
                              style: TextStyle(
                                  color: themeNotifier.isDark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 40),
                              // )
                            ),
                            onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        HelpScreen(),
                                  ),
                                )),
                        SizedBox(height: 24),
                        ListTile(
                            title: Text(
                              translate("drawer.about"),
                              style: TextStyle(
                                  color: themeNotifier.isDark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 40),
                              // )
                            ),
                            onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AboutScreen(),
                                  ),
                                )),
                        SizedBox(height: 24),
                        ListTile(
                            title: Text(
                              translate("drawer.custom"),
                              style: TextStyle(
                                  color: themeNotifier.isDark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 40),
                            ),
                            onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CustomBuilder(),
                                  ),
                                )),
                        SizedBox(height: 24),
                        ListTile(
                            title: Text(
                              translate("drawer.task"),
                              style: TextStyle(
                                  color: themeNotifier.isDark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 40),
                            ),
                            onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LGtasks(),
                                  ),
                                )),
                        SizedBox(height: 24),
                        ListTile(
                            title: Text(
                              translate("drawer.settings"),
                              style: TextStyle(
                                  color: themeNotifier.isDark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 40),
                            ),
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
                                    val = themeNotifier.isDark ? value : !value;
                                  });
                                  themeNotifier.isDark
                                      ? themeNotifier.isDark = false
                                      : themeNotifier.isDark = true;
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
