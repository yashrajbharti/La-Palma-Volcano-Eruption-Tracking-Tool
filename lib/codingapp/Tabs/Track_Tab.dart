import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async' show Future;
import 'dart:developer';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:ssh2/ssh2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:voltrac/codingapp/kml/LookAt.dart';
import 'package:voltrac/codingapp/kml/orbit.dart';
import 'package:voltrac/codingapp/menuOptions/custom_builder.dart';
import 'package:voltrac/codingapp/theme-storage.dart';
import 'package:voltrac/codingapp/kml/kml.dart';
import 'package:voltrac/codingapp/menuOptions/lg_tasks.dart';
import 'package:voltrac/codingapp/Tabs/Info.dart';

class SendtoLG extends StatefulWidget {
  SendtoLG({Key? key}) : super(key: key);

  @override
  State<SendtoLG> createState() => _SendtoLGState();
}

List<String> kmltext = ['', '', '', '', '', '', '', ''];
String localpath = "";
bool isOpen = false;
bool loading = false;
double latvalue = 28.65665656297236;
double longvalue = -17.885454520583153;
List<String> projectname = [
  "Historic_Track",
  "Lava_Flow",
  "Prehistoric_Track",
  "Affected_Areas",
  "Landscape",
  "SO2_Emission",
  "Situation",
  "Located_Events"
];
var _duration = 3000;
// List<String> localimages = [
//   "vent.png",
//   "red_sq.png",
//   "yellow_sq.png",
//   "black_sq.png"
// ];
bool stopdemo = false;
bool isdemoactive = false;
bool blackandwhite = false;
String finalname = "";
String finaltext = "";
KML kml = KML("", "");
Future<String> _read(int i) async {
  try {
    final Directory directory = await getApplicationDocumentsDirectory();
    localpath = '${directory.path}/${projectname[i]}.txt';
    finalname = projectname[i];
    kmltext[i] =
        await rootBundle.loadString('assets/kml_files/${projectname[i]}.txt');
    finaltext = kmltext[i];
    log(finalname);
  } catch (e) {
    print("Couldn't read file");
    print(e);
  }
  kml = KML(finalname, finaltext);
  return kmltext[i];
}

class _SendtoLGState extends State<SendtoLG> {
  showAlertDialog(String title, String msg, bool blackandwhite) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 4, sigmaY: 3),
            child: AlertDialog(
              backgroundColor: blackandwhite
                  ? Color.fromARGB(255, 16, 16, 16)
                  : Color.fromARGB(255, 33, 33, 33),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Image.asset(
                        "assets/sad.png",
                        width: 250,
                        height: 250,
                      )),
                  Text(
                    '$title',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 204, 204, 204),
                    ),
                  ),
                ],
              ),
              content: SizedBox(
                width: 320,
                height: 180,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('$msg',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(
                              255,
                              204,
                              204,
                              204,
                            ),
                          ),
                          textAlign: TextAlign.center),
                      SizedBox(
                          width: 300,
                          child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 2,
                                  shadowColor: Colors.black,
                                  primary:
                                      ui.Color.fromARGB(255, 220, 220, 220),
                                  padding: EdgeInsets.all(15),
                                  shape: StadiumBorder(),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Wrap(
                                  children: <Widget>[
                                    Text(translate('dismiss'),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                  ],
                                ),
                              ))),
                    ]),
              ),
            ));
      },
    );
  }

  _One(bool isDark) async {
    _showToast(
        translate("Track.loading") + "(" + translate('Track.hist').trim() + ")",
        isDark);
    await _read(0);
    await LGConnection().openBalloon(
        projectname[0],
        translate('Track.hist').trim(),
        translate("info.hist.date"),
        240,
        translate("info.description") +
            " " +
            translate("info.hist.description"),
        "COPERNICUS, ResearchGate, Global Volcanism Program",
        translate('title.name'),
        "historic_infographic.png");
    _showToast(
        translate("Track.sending") + "(" + translate('Track.hist').trim() + ")",
        isDark);
    LGConnection().sendToLG(kml.mount(), finalname).then((value) async {
      if (stopdemo == false) {
        _showToast(
            translate('Track.Visualize') +
                "(" +
                translate('Track.hist').trim() +
                ")",
            isDark);
        await LGConnection().cleanOrbit();
        await Future.delayed(Duration(seconds: 6)).then((value) {
          _showToast(
              translate('map.buildorbit') +
                  "(" +
                  translate('Track.hist').trim() +
                  ")",
              isDark);
          playOrbit();
        });

        await Future.delayed(Duration(seconds: 50)).then((value) {
          _Two(isDark);
        });
      } else {
        LGConnection().cleanVisualization();
      }
    }).catchError((onError) {
      print('oh no $onError');
      setState(() {
        loading = false;
      });
      if (onError == 'nogeodata') {
        showAlertDialog(
            translate('Track.alert'), translate('Track.alert2'), isDark);
      }
      showAlertDialog(
          translate('Track.alert3'), translate('Track.alert4'), isDark);
    });
    ;
  }

  _Two(bool isDark) async {
    _showToast(
        translate("Track.loading") + "(" + translate('Track.lava').trim() + ")",
        isDark);
    await _read(1);
    await LGConnection().openBalloon(
        projectname[1],
        translate('Track.lava').trim(),
        translate("info.lava.date"),
        240,
        translate("info.description") +
            " " +
            translate("info.lava.description"),
        "COPERNICUS, Wikipedia | Cumbre Vieja",
        translate('title.name'),
        "lavaflow_infographic.jpg");
    _showToast(
        translate("Track.sending") + "(" + translate('Track.lava').trim() + ")",
        isDark);
    LGConnection().sendToLG(kml.mount(), finalname).then((value) async {
      if (stopdemo == false) {
        _showToast(
            translate('Track.Visualize') +
                "(" +
                translate('Track.lava').trim() +
                ")",
            isDark);
        await LGConnection().cleanOrbit();
        await Future.delayed(Duration(seconds: 6)).then((value) {
          _showToast(
              translate('map.buildorbit') +
                  "(" +
                  translate('Track.lava').trim() +
                  ")",
              isDark);
          playOrbit();
        });

        await Future.delayed(Duration(seconds: 50)).then((value) {
          _Three(isDark);
        });
      } else {
        LGConnection().cleanVisualization();
      }
    });
  }

  _Three(bool isDark) async {
    _showToast(
        translate("Track.loading") +
            "(" +
            translate('Track.prehistoric').trim() +
            ")",
        isDark);
    await _read(2);
    await LGConnection().openBalloon(
        projectname[2],
        translate('Track.prehistoric').trim(),
        translate("info.prehistoric.date"),
        270,
        translate("info.description") +
            " " +
            translate("info.prehistoric.description"),
        "ResearchGate, Global Volcanism Program",
        translate('title.name'),
        "prehistoric_infographic.png");
    _showToast(
        translate("Track.sending") +
            "(" +
            translate('Track.prehistoric').trim() +
            ")",
        isDark);
    LGConnection().sendToLG(kml.mount(), finalname).then((value) async {
      if (stopdemo == false) {
        _showToast(
            translate('Track.Visualize') +
                "(" +
                translate('Track.prehistoric').trim() +
                ")",
            isDark);
        await LGConnection().cleanOrbit();
        await Future.delayed(Duration(seconds: 6)).then((value) {
          _showToast(
              translate('map.buildorbit') +
                  "(" +
                  translate('Track.prehistoric').trim() +
                  ")",
              isDark);
          playOrbit();
        });

        await Future.delayed(Duration(seconds: 50)).then((value) {
          _Four(isDark);
        });
      } else {
        LGConnection().cleanVisualization();
      }
    });
  }

  _Four(bool isDark) async {
    _showToast(
        translate("Track.loading") + "(" + translate('Track.aff').trim() + ")",
        isDark);
    await _read(3);
    await LGConnection().openBalloon(
        projectname[3],
        translate('Track.aff').trim(),
        translate("info.aff.date"),
        240,
        translate("info.description") + " " + translate("info.aff.description"),
        "COPERNICUS",
        translate('title.name'),
        "affectedareas_infographic.jpg");
    _showToast(
        translate("Track.sending") + "(" + translate('Track.aff').trim() + ")",
        isDark);
    LGConnection().sendToLG(kml.mount(), finalname).then((value) async {
      if (stopdemo == false) {
        _showToast(
            translate('Track.Visualize') +
                "(" +
                translate('Track.aff').trim() +
                ")",
            isDark);
        await LGConnection().cleanOrbit();
        await Future.delayed(Duration(seconds: 6)).then((value) {
          _showToast(
              translate('map.buildorbit') +
                  "(" +
                  translate('Track.aff').trim() +
                  ")",
              isDark);
          playOrbit();
        });

        await Future.delayed(Duration(seconds: 50)).then((value) {
          _Five(isDark);
        });
      } else {
        LGConnection().cleanVisualization();
      }
    });
  }

  _Five(bool isDark) async {
    _showToast(
        translate("Track.loading") + "(" + translate('Track.land').trim() + ")",
        isDark);
    await _read(4);
    await LGConnection().openBalloon(
        projectname[4],
        translate('Track.land').trim(),
        translate("info.land.date"),
        240,
        translate("info.description") +
            " " +
            translate("info.land.description"),
        "NASA Earth Observatory , Sentinel Playground, COPERNICUS",
        translate('title.name'),
        "landscape_infographic.jpg");
    _showToast(
        translate("Track.sending") + "(" + translate('Track.land').trim() + ")",
        isDark);
    LGConnection().sendToLG(kml.mount(), finalname).then((value) async {
      if (stopdemo == false) {
        _showToast(
            translate('Track.Visualize') +
                "(" +
                translate('Track.land').trim() +
                ")",
            isDark);
        await LGConnection().cleanOrbit();
        await Future.delayed(Duration(seconds: 6)).then((value) {
          _showToast(
              translate('map.buildorbit') +
                  "(" +
                  translate('Track.land').trim() +
                  ")",
              isDark);
          playOrbit();
        });

        await Future.delayed(Duration(seconds: 50)).then((value) {
          _Six(isDark);
        });
      } else {
        LGConnection().cleanVisualization();
      }
    });
  }

  _Six(bool isDark) async {
    _showToast(
        translate("Track.loading") + "(" + translate('Track.So2').trim() + ")",
        isDark);
    await _read(5);
    await LGConnection().openBalloon(
        projectname[5],
        translate('Track.So2').trim(),
        translate("info.So2.date"),
        240,
        translate("info.description") + " " + translate("info.So2.description"),
        "Sentinel EO Browser, GDACS, Twitter | Platform ADAM",
        translate('title.name'),
        "so2_infographic.gif");
    _showToast(
        translate("Track.sending") + "(" + translate('Track.So2').trim() + ")",
        isDark);
    LGConnection().sendToLG(kml.mount(), finalname).then((value) async {
      if (stopdemo == false) {
        _showToast(
            translate('Track.Visualize') +
                "(" +
                translate('Track.So2').trim() +
                ")",
            isDark);
        await LGConnection().cleanOrbit();
        await Future.delayed(Duration(seconds: 6)).then((value) {
          _showToast(
              translate('map.buildorbit') +
                  "(" +
                  translate('Track.So2').trim() +
                  ")",
              isDark);
          playOrbit();
        });

        await Future.delayed(Duration(seconds: 50)).then((value) {
          _Seven(isDark);
        });
      } else {
        LGConnection().cleanVisualization();
      }
    });
  }

  _Seven(bool isDark) async {
    _showToast(
        translate("Track.loading") +
            "(" +
            translate('Track.situation').trim() +
            ")",
        isDark);
    await _read(6);
    await LGConnection().openBalloon(
        projectname[6],
        translate('Track.situation').trim(),
        translate("info.situation.date"),
        270,
        translate("info.description") +
            " " +
            translate("info.situation.description"),
        "Instituto Geográfico Nacional, GDACS, ERCC Portal",
        translate('title.name'),
        "situation_infographic.png");
    _showToast(
        translate("Track.sending") +
            "(" +
            translate('Track.situation').trim() +
            ")",
        isDark);
    LGConnection().sendToLG(kml.mount(), finalname).then((value) async {
      if (stopdemo == false) {
        _showToast(
            translate('Track.Visualize') +
                "(" +
                translate('Track.situation').trim() +
                ")",
            isDark);
        await LGConnection().cleanOrbit();
        await Future.delayed(Duration(seconds: 6)).then((value) {
          _showToast(
              translate('map.buildorbit') +
                  "(" +
                  translate('Track.situation').trim() +
                  ")",
              isDark);
          playOrbit();
        });

        await Future.delayed(Duration(seconds: 50)).then((value) {
          _Eight(isDark);
        });
      } else {
        LGConnection().cleanVisualization();
      }
    });
  }

  _Eight(bool isDark) async {
    _showToast(
        translate("Track.loading") +
            "(" +
            translate('Track.located').trim() +
            ")",
        isDark);
    await _read(7);
    await LGConnection().openBalloon(
        projectname[7],
        translate('Track.located').trim(),
        translate("info.located.date"),
        230,
        translate("info.description") +
            " " +
            translate("info.located.description"),
        "Instituto Geográfico Nacional",
        translate('title.name'),
        "locatedevents_infographic.jpg");
    _showToast(
        translate("Track.sending") +
            "(" +
            translate('Track.located').trim() +
            ")",
        isDark);
    LGConnection().sendToLG(kml.mount(), finalname).then((value) async {
      if (stopdemo == false) {
        _showToast(
            translate('Track.Visualize') +
                "(" +
                translate('Track.located').trim() +
                ")",
            isDark);
        await LGConnection().cleanOrbit();
        await Future.delayed(Duration(seconds: 6)).then((value) {
          _showToast(
              translate('map.buildorbit') +
                  "(" +
                  translate('Track.located').trim() +
                  ")",
              isDark);
          playOrbit();
        });
      } else {
        LGConnection().cleanVisualization();
      }
    });
  }

  playOrbit() async {
    await LGConnection()
        .buildOrbit(Orbit.buildOrbit(Orbit.generateOrbitTag(LookAt(
            double.parse((await longvalue).toStringAsFixed(2)),
            double.parse((await latvalue).toStringAsFixed(2)),
            "30492.665945696469",
            "0",
            "0"))))
        .then((value) async {
      await LGConnection().startOrbit();
    });
  }

  stopOrbit() async {
    await LGConnection().stopOrbit();
  }

  void _showToast(String x, bool blackandwhite) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "$x",
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
              fontFamily: "GoogleSans",
              color: Colors.white),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: blackandwhite
            ? ui.Color.fromARGB(255, 22, 22, 22)
            : ui.Color.fromARGB(250, 43, 43, 43),
        width: 500.0,
        padding: const EdgeInsets.fromLTRB(
          35,
          20,
          15,
          20,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        action: SnackBarAction(
          textColor: Color.fromARGB(255, 125, 164, 243),
          label: translate('Track.close'),
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) => Container(
              margin: const EdgeInsets.fromLTRB(90, 30, 90, 0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 500,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              shadowColor: themeNotifier.isDark
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.3),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15),
                            ),
                            onPressed: () async {
                              savekml_Task(projectname[0]);
                              await _read(0);
                              await LGConnection().openBalloon(
                                  projectname[0],
                                  translate('Track.hist').trim(),
                                  translate("info.hist.date"),
                                  240,
                                  translate("info.description") +
                                      " " +
                                      translate("info.hist.description"),
                                  "COPERNICUS, ResearchGate, Global Volcanism Program",
                                  translate('title.name'),
                                  "historic_infographic.png");
                              setState(() {
                                _duration = 2290;
                              });
                              jumpToPage(0);
                              _showToast(translate('Track.ready'),
                                  themeNotifier.isDark);
                            },
                            child: Wrap(
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Text(translate('Track.hist'),
                                    style: TextStyle(fontSize: 40)),
                                Transform.scale(
                                    scale: 1.5,
                                    child: Builder(
                                      builder: (context) => IconButton(
                                        icon: Image.asset(
                                            'assets/icons/historic.png'),
                                        onPressed: null,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 500,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              shadowColor: themeNotifier.isDark
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.3),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15),
                            ),
                            onPressed: () async {
                              savekml_Task(projectname[1]);
                              await _read(1);
                              await LGConnection().openBalloon(
                                  projectname[1],
                                  translate('Track.lava').trim(),
                                  translate("info.lava.date"),
                                  240,
                                  translate("info.description") +
                                      " " +
                                      translate("info.lava.description"),
                                  "COPERNICUS, Wikipedia | Cumbre Vieja",
                                  translate('title.name'),
                                  "lavaflow_infographic.jpg");
                              setState(() {
                                _duration = 4000;
                              });
                              jumpToPage(1);
                              _showToast(translate('Track.ready'),
                                  themeNotifier.isDark);
                            },
                            child: Wrap(
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Text(translate('Track.lava'),
                                    style: TextStyle(fontSize: 40)),
                                Transform.scale(
                                    scale: 1.5,
                                    child: Builder(
                                      builder: (context) => IconButton(
                                        icon: Image.asset(
                                            'assets/icons/lavaflow.png'),
                                        onPressed: null,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        )
                      ]),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 500,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2,
                              shadowColor: themeNotifier.isDark
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.3),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15)),
                          onPressed: () async {
                            savekml_Task(projectname[2]);
                            await _read(2);
                            await LGConnection().openBalloon(
                                projectname[2],
                                translate('Track.prehistoric').trim(),
                                translate("info.prehistoric.date"),
                                270,
                                translate("info.description") +
                                    " " +
                                    translate("info.prehistoric.description"),
                                "ResearchGate, Global Volcanism Program",
                                translate('title.name'),
                                "prehistoric_infographic.png");
                            setState(() {
                              _duration = 2080;
                            });
                            jumpToPage(2);
                            _showToast(
                                translate('Track.ready'), themeNotifier.isDark);
                          },
                          child: Wrap(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Text(translate('Track.prehistoric'),
                                  style: TextStyle(fontSize: 40)),
                              Transform.scale(
                                  scale: 1.5,
                                  child: Builder(
                                    builder: (context) => IconButton(
                                      icon: Image.asset(
                                          'assets/icons/prehistoric.png'),
                                      onPressed: null,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 500,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2,
                              shadowColor: themeNotifier.isDark
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.3),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15)),
                          onPressed: () async {
                            savekml_Task(projectname[3]);
                            await _read(3);
                            await LGConnection().openBalloon(
                                projectname[3],
                                translate('Track.aff').trim(),
                                translate("info.aff.date"),
                                240,
                                translate("info.description") +
                                    " " +
                                    translate("info.aff.description"),
                                "COPERNICUS",
                                translate('title.name'),
                                "affectedareas_infographic.jpg");
                            setState(() {
                              _duration = 56040;
                            });
                            jumpToPage(3);
                            _showToast(
                                translate('Track.ready'), themeNotifier.isDark);
                          },
                          child: Wrap(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Text(translate('Track.aff'),
                                  style: TextStyle(fontSize: 40)),
                              Transform.scale(
                                  scale: 1.5,
                                  child: Builder(
                                    builder: (context) => IconButton(
                                      icon: Image.asset(
                                          'assets/icons/affectedareas.png'),
                                      onPressed: null,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 500,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              shadowColor: themeNotifier.isDark
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.3),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15),
                            ),
                            onPressed: () async {
                              savekml_Task(projectname[4]);
                              await _read(4);
                              await LGConnection().openBalloon(
                                  projectname[4],
                                  translate('Track.land').trim(),
                                  translate("info.land.date"),
                                  240,
                                  translate("info.description") +
                                      " " +
                                      translate("info.land.description"),
                                  "NASA Earth Observatory , Sentinel Playground, COPERNICUS",
                                  translate('title.name'),
                                  "landscape_infographic.jpg");
                              setState(() {
                                _duration = 4000;
                              });
                              jumpToPage(4);
                              _showToast(translate('Track.ready'),
                                  themeNotifier.isDark);
                            },
                            child: Wrap(
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Text(translate('Track.land'),
                                    style: TextStyle(fontSize: 40)),
                                Transform.scale(
                                    scale: 1.9,
                                    child: Builder(
                                      builder: (context) => IconButton(
                                        icon: Image.asset(
                                            'assets/icons/landscape.png'),
                                        onPressed: null,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 500,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              shadowColor: themeNotifier.isDark
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.3),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15),
                            ),
                            onPressed: () async {
                              savekml_Task(projectname[5]);
                              await _read(5);
                              await LGConnection().openBalloon(
                                  projectname[5],
                                  translate('Track.So2').trim(),
                                  translate("info.So2.date"),
                                  240,
                                  translate("info.description") +
                                      " " +
                                      translate("info.So2.description"),
                                  "Sentinel EO Browser, GDACS, Twitter | Platform ADAM",
                                  translate('title.name'),
                                  "so2_infographic.gif");
                              setState(() {
                                _duration = 3710;
                              });
                              jumpToPage(5);
                              _showToast(translate('Track.ready'),
                                  themeNotifier.isDark);
                            },
                            child: Wrap(
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Text(translate('Track.So2'),
                                    style: TextStyle(fontSize: 40)),
                                Transform.scale(
                                    scale: 1.5,
                                    child: Builder(
                                      builder: (context) => IconButton(
                                        icon: Image.asset(
                                            'assets/icons/so2emissions.png'),
                                        onPressed: null,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        )
                      ]),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 500,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2,
                              shadowColor: themeNotifier.isDark
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.3),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15)),
                          onPressed: () async {
                            savekml_Task(projectname[6]);
                            await _read(6);
                            await LGConnection().openBalloon(
                                projectname[6],
                                translate('Track.situation').trim(),
                                translate("info.situation.date"),
                                270,
                                translate("info.description") +
                                    " " +
                                    translate("info.situation.description"),
                                "Instituto Geográfico Nacional, GDACS, ERCC Portal",
                                translate('title.name'),
                                "situation_infographic.png");
                            setState(() {
                              _duration = 5250;
                            });
                            jumpToPage(6);
                            _showToast(
                                translate('Track.ready'), themeNotifier.isDark);
                          },
                          child: Wrap(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Text(translate('Track.situation'),
                                  style: TextStyle(fontSize: 40)),
                              Transform.scale(
                                  scale: 1.5,
                                  child: Builder(
                                    builder: (context) => IconButton(
                                      icon: Image.asset(
                                          'assets/icons/situation.png'),
                                      onPressed: null,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 500,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2,
                              shadowColor: themeNotifier.isDark
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.3),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15)),
                          onPressed: () async {
                            savekml_Task(projectname[7]);
                            await _read(7);
                            await LGConnection().openBalloon(
                                projectname[7],
                                translate('Track.located').trim(),
                                translate("info.located.date"),
                                230,
                                translate("info.description") +
                                    " " +
                                    translate("info.located.description"),
                                "Instituto Geográfico Nacional",
                                translate('title.name'),
                                "locatedevents_infographic.jpg");
                            setState(() {
                              _duration = 8710;
                            });
                            jumpToPage(7);
                            _showToast(
                                translate('Track.ready'), themeNotifier.isDark);
                          },
                          child: Wrap(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Text(translate('Track.located'),
                                  style: TextStyle(fontSize: 40)),
                              Transform.scale(
                                  scale: 1.5,
                                  child: Builder(
                                    builder: (context) => IconButton(
                                      icon: Image.asset(
                                          'assets/icons/locatedevents.png'),
                                      onPressed: null,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Builder(
                          builder: (context) => IconButton(
                              icon: themeNotifier.isDark
                                  ? Image.asset(
                                      'assets/icons/calendar_dark.png')
                                  : Image.asset('assets/icons/calendar.png'),
                              iconSize: 65,
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CustomBuilder(),
                                  ),
                                );
                              })),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 360,
                        child: loading
                            ? LinearPercentIndicator(
                                animation: true,
                                width: 360,
                                lineHeight: 76.0,
                                backgroundColor: themeNotifier.isDark
                                    ? ui.Color.fromARGB(205, 42, 47, 48)
                                    : ui.Color.fromARGB(205, 180, 199, 206),
                                percent: 1.0,
                                padding: EdgeInsets.all(0),
                                animationDuration: _duration,
                                center: Wrap(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(translate('Track.visual'),
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: ui.FontWeight.w500)),
                                    Icon(
                                      Icons.location_on_sharp,
                                      color: ui.Color.fromARGB(255, 228, 6, 9),
                                      size: 45.0,
                                    ),
                                  ],
                                ),
                                barRadius: ui.Radius.circular(50),
                                progressColor: Colors.greenAccent,
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 2,
                                  shadowColor: themeNotifier.isDark
                                      ? Colors.black
                                      : Colors.grey.withOpacity(0.3),
                                  primary: themeNotifier.isDark
                                      ? ui.Color.fromARGB(255, 30, 30, 30)
                                      : Colors.white,
                                  padding: EdgeInsets.all(15),
                                  shape: StadiumBorder(),
                                ),
                                child: Wrap(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(translate('Track.visual'),
                                        style: TextStyle(fontSize: 35)),
                                    Icon(
                                      Icons.location_on_sharp,
                                      color: ui.Color.fromARGB(255, 228, 6, 9),
                                      size: 45.0,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  // send to LG
                                  setState(() {
                                    loading = true;
                                  });

                                  LGConnection()
                                      .sendToLG(kml.mount(), finalname)
                                      .then((value) {
                                    _showToast(translate('Track.Visualize'),
                                        themeNotifier.isDark);

                                    setState(() {
                                      isOpen = true;
                                      loading = false;
                                    });
                                    retryButton(
                                        kml.mount(), finalname, _duration / 2);
                                    DefaultTabController.of(context)
                                        ?.animateTo(2);
                                  }).catchError((onError) {
                                    print('oh no $onError');
                                    setState(() {
                                      loading = false;
                                    });
                                    if (onError == 'nogeodata') {
                                      showAlertDialog(
                                          translate('Track.alert'),
                                          translate('Track.alert2'),
                                          themeNotifier.isDark);
                                    }
                                    showAlertDialog(
                                        translate('Track.alert3'),
                                        translate('Track.alert4'),
                                        themeNotifier.isDark);
                                  });
                                }),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      isdemoactive
                          ? Transform.scale(
                              scale: 0.925,
                              child: Builder(
                                  builder: (context) => IconButton(
                                        icon: themeNotifier.isDark
                                            ? Image.asset(
                                                'assets/icons/stop-button-black.png')
                                            : Image.asset(
                                                'assets/icons/stop-button.png'),
                                        iconSize: 70,
                                        onPressed: () {
                                          // A demo of all buttons
                                          setState(() {
                                            stopdemo = true;
                                            isdemoactive = false;
                                          });
                                        },
                                      )))
                          : Transform.scale(
                              scale: 1.25,
                              child: Builder(
                                  builder: (context) => IconButton(
                                        icon: themeNotifier.isDark
                                            ? Image.asset(
                                                'assets/icons/demo_dark.png')
                                            : Image.asset(
                                                'assets/icons/demo.png'),
                                        iconSize: 70,
                                        onPressed: () {
                                          // A demo of all buttons
                                          setState(() {
                                            stopdemo = false;
                                            isdemoactive = true;
                                          });
                                          _One(themeNotifier.isDark);
                                        },
                                      )))
                    ],
                  ),
                ],
              ),
            ));
  }
}

class LGConnection {
  Future openBalloon(
      String name,
      String track,
      String time,
      int height,
      String description,
      String sources,
      String appname,
      String imagename) async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );
    int rigs = 3;
    rigs = (int.parse(credencials['numberofrigs']) / 2).floor() + 1;
    String openBalloonKML = '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
<Document>
	<name>$name.kml</name>
	<Style id="purple_paddle">
		<IconStyle>
			<Icon>
				<href>https://raw.githubusercontent.com/yashrajbharti/kml-images/main/molten.png</href>
			</Icon>
		</IconStyle>
		<BalloonStyle>
			<text>\$[description]</text>
      <bgColor>ff1e1e1e</bgColor>
		</BalloonStyle>
	</Style>
	<Placemark id="0A7ACC68BF23CB81B354">
		<name>$track</name>
		<Snippet maxLines="0"></Snippet>
		<description><![CDATA[<!-- BalloonStyle background color:
ffffffff
 -->
<!-- Icon URL:
http://maps.google.com/mapfiles/kml/paddle/purple-blank.png
 -->
<table width="400" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td colspan="2" align="center">
      <img src="https://raw.githubusercontent.com/yashrajbharti/kml-images/main/volcano.png" alt="picture" width="150" height="150" />
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <h2><font color='#00CC99'>$track</font></h2>
      <h3><font color='#00CC99'>$time</font></h3>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <img src="https://raw.githubusercontent.com/yashrajbharti/kml-images/main/$imagename" alt="picture" width="400" height="$height" />    </td>
  </tr>  
  <tr>
    <td colspan="2">
      <p><font color="#3399CC">$description</font></p>
    </td>
  </tr>
  <tr>
    <td align="center">
      <a href="#">$sources</a>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <font color="#999999">@$appname 2022</font>
    </td>
  </tr>
</table>]]></description>
		<LookAt>
			<longitude>-17.841486</longitude>
			<latitude>28.638478</latitude>
			<altitude>0</altitude>
			<heading>0</heading>
			<tilt>0</tilt>
			<range>24000</range>
		</LookAt>
		<styleUrl>#purple_paddle</styleUrl>
		<gx:balloonVisibility>1</gx:balloonVisibility>
		<Point>
			<coordinates>-17.841486,28.638478,0</coordinates>
		</Point>
	</Placemark>
</Document>
</kml>
''';
    try {
      await client.connect();
      return await client.execute(
          "echo '$openBalloonKML' > /var/www/html/kml/slave_$rigs.kml");
    } catch (e) {
      return Future.error(e);
    }
  }

  Future sendToLG(String kml, String projectname) async {
    if (kml.isNotEmpty) {
      return _createLocalFile(kml, projectname);
    }
    return Future.error('nogeodata');
  }

  Future cleanVisualization() async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );

    try {
      await client.connect();
      stopOrbit();
      return await client.execute('> /var/www/html/kmls.txt');
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  _getCredentials() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String ipAddress = preferences.getString('master_ip') ?? '';
    String password = preferences.getString('master_password') ?? '';
    String portNumber = preferences.getString('master_portNumber') ?? '';
    String username = preferences.getString('master_username') ?? '';
    String numberofrigs = preferences.getString('numberofrigs') ?? '';

    return {
      "ip": ipAddress,
      "pass": password,
      "port": portNumber,
      "username": username,
      "numberofrigs": numberofrigs
    };
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  _createLocalFile(String kml, String projectname) async {
    String localPath = await _localPath;
    File localFile = File('$localPath/$projectname.kml');
    localFile.writeAsString(kml);
    File localFile2 = File('$localPath/kmls.txt');
    localFile2.writeAsString(kml);
    return _uploadToLG('$localPath/$projectname.kml', projectname);
  }

  // _createLocalImage(String imgName, String assetsUrl) async {
  //   Directory directory = await getApplicationDocumentsDirectory();
  //   String imgPath = '${directory.path}/$imgName';
  //   ByteData data = await rootBundle.load(assetsUrl);
  //   List<int> bytes =
  //       data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //   await File(imgPath).writeAsBytes(bytes);
  //   return imgPath;
  // }

  _uploadToLG(String localPath, String projectname) async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );

    LookAt flyto = LookAt(
      projectname == "Historic_Track"
          ? -17.885454
          : projectname == "Located_Events"
              ? -17.834886
              : projectname == "SO2_Emission"
                  ? -7.561565
                  : projectname == "Prehistoric_Track"
                      ? -17.885454
                      : projectname == "Lava_Flow"
                          ? -17.892286
                          : -17.895486,
      projectname == "Historic_Track"
          ? 28.556656
          : projectname == "Located_Events"
              ? 28.564986
              : projectname == "SO2_Emission"
                  ? 33.561245
                  : projectname == "Prehistoric_Track"
                      ? 28.556656
                      : projectname == "Lava_Flow"
                          ? 28.616354
                          : projectname == "Affected_Areas"
                              ? 28.616354
                              : projectname == "Situation"
                                  ? 28.597354
                                  : projectname == "Landscape"
                                      ? 28.616354
                                      : 28.610478,
      projectname == "Located_Events"
          ? '${61708.9978371 / int.parse(credencials['numberofrigs'])}'
          : projectname == "Lava_Flow"
              ? '${18208.9978371 / int.parse(credencials['numberofrigs'])}'
              : projectname == "Landscape"
                  ? '${65208.997837 / int.parse(credencials['numberofrigs'])}'
                  : projectname == "Affected_Areas"
                      ? '${18208.9978371 / int.parse(credencials['numberofrigs'])}'
                      : projectname == "Situation"
                          ? '${75208.9978371 / int.parse(credencials['numberofrigs'])}'
                          : projectname == "Historic_Track"
                              ? '${151708.997837 / int.parse(credencials['numberofrigs'])}'
                              : projectname == "SO2_Emission"
                                  ? '${10500001.9978 / int.parse(credencials['numberofrigs'])}'
                                  : projectname == "Prehistoric_Track"
                                      ? '${151708.997837 / int.parse(credencials['numberofrigs'])}'
                                      : '${91708.9978371 / int.parse(credencials['numberofrigs'])}',
      projectname == "Historic_Track"
          ? '41.82725143432617'
          : projectname == "SO2_Emission"
              ? '25'
              : projectname == "Prehistoric_Track"
                  ? '41.82725143432617'
                  : '45',
      projectname == "Historic_Track"
          ? ' 61.403038024902344'
          : projectname == "Prehistoric_Track"
              ? ' 61.403038024902344'
              : '0',
    );
    try {
      await client.connect();
      await client.execute('> /var/www/html/kmls.txt');

      // upload kml
      await client.connectSFTP();
      await client.sftpUpload(
        path: localPath,
        toPath: '/var/www/html',
        callback: (progress) {
          print('Sent $progress');
        },
      );

      // for (int k = 0; k < localimages.length; k++) {
      //   String imgPath = await _createLocalImage(
      //       localimages[k], "assets/icons/${localimages[k]}");
      //   await client.sftpUpload(path: imgPath, toPath: '/var/www/html');
      // }
      await client.execute(
          'echo "http://lg1:81/$projectname.kml" > /var/www/html/kmls.txt');

      return await client.execute(
          'echo "flytoview=${flyto.generateLinearString()}" > /tmp/query.txt');
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  buildOrbit(String content) async {
    dynamic credencials = await _getCredentials();

    String localPath = await _localPath;
    File localFile = File('$localPath/Orbit.kml');
    localFile.writeAsString(content);

    String filePath = '$localPath/Orbit.kml';

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );

    try {
      await client.connect();
      await client.connectSFTP();
      await client.sftpUpload(
        path: filePath,
        toPath: '/var/www/html',
        callback: (progress) {
          print('Sent $progress');
        },
      );
      return await client.execute(
          "echo '\nhttp://lg1:81/Orbit.kml' >> /var/www/html/kmls.txt");
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  startOrbit() async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );

    try {
      await client.connect();
      return await client.execute('echo "playtour=Orbit" > /tmp/query.txt');
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  cleanOrbit() async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );

    try {
      await client.connect();
      return await client.execute('echo "" > /tmp/query.txt');
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  stopOrbit() async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );

    try {
      await client.connect();
      return await client.execute('echo "exittour=true" > /tmp/query.txt');
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }
}
