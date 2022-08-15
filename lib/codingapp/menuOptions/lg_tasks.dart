import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';
import 'package:webscrapperapp/codingapp/drawer.dart';
import 'package:webscrapperapp/codingapp/kml/kml.dart';
import 'package:webscrapperapp/codingapp/kml/kmlgenerator.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:ui' as ui;
// ignore: import_of_legacy_library_into_null_safe
import 'package:ssh/ssh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:webscrapperapp/codingapp/theme-storage.dart';

class LGtasks extends StatefulWidget {
  LGtasks({Key? key}) : super(key: key);

  @override
  State<LGtasks> createState() => _LGtasksState();
}

String kmltext = "";
String localpath = "";
bool isOpen = false;
bool isSuccess = false;
String projectname = "";
bool blackandwhite = false;
KML kml = KML("", "");
Future savekml_Task(String kmlname) async {
  try {
    projectname = kmlname;
    final Directory directory = await getApplicationDocumentsDirectory();
    // final File file = File('${directory.path}/$kmlname.txt');
    localpath = '${directory.path}/$kmlname.txt';
    kmltext = await rootBundle.loadString('assets/kml_files/$kmlname.txt');
  } catch (e) {
    print("Couldn't read file");
  }
  kml = KML(projectname, kmltext);
}

class _LGtasksState extends State<LGtasks> {
  showAlertDialog(
      String title, String msg, bool isSuccess, bool blackandwhite) {
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
                        isSuccess ? "assets/happy.png" : "assets/sad.png",
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
                                    Text(
                                        isSuccess
                                            ? translate('continue')
                                            : translate('dismiss'),
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

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) => Scaffold(
              extendBodyBehindAppBar: true,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: 50.0,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Drawers(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              backgroundColor: themeNotifier.isDark
                  ? Color.fromARGB(255, 16, 16, 16)
                  : Color.fromARGB(255, 204, 204, 204),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 10.0, top: 50),
                          child: Text(
                            translate("Tasks.LG"),
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: themeNotifier.isDark
                                  ? Colors.white
                                  : Color.fromARGB(255, 0, 0, 0),
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 140.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 340,
                                  height: 180,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 2,
                                      shadowColor: themeNotifier.isDark
                                          ? Colors.black
                                          : Colors.grey.withOpacity(0.5),
                                      primary:
                                          Color.fromARGB(255, 115, 184, 117),
                                      padding: EdgeInsets.all(15),
                                      shape: StadiumBorder(),
                                    ),
                                    child: Wrap(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          translate("Tasks.Relaunch"),
                                          style: TextStyle(
                                              fontSize: 42,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      // send to LG
                                      LGConnection().relaunchLG().then((value) {
                                        setState(() {
                                          isOpen = false;
                                        });
                                      }).catchError((onError) {
                                        print('oh no $onError');
                                        showAlertDialog(
                                            translate("Tasks.alert5"),
                                            translate("Tasks.alert6"),
                                            false,
                                            themeNotifier.isDark);
                                      });
                                    },
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 340,
                                  height: 180,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 2,
                                        shadowColor: themeNotifier.isDark
                                            ? Colors.black
                                            : Colors.grey.withOpacity(0.5),
                                        primary:
                                            Color.fromARGB(255, 232, 108, 99),
                                        padding: EdgeInsets.all(15),
                                        shape: StadiumBorder(),
                                      ),
                                      child: Wrap(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(translate("Tasks.Shutdown"),
                                              style: TextStyle(
                                                  fontSize: 42,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0))),
                                        ],
                                      ),
                                      onPressed: () {
                                        // send to LG
                                        LGConnection()
                                            .shutdownLG()
                                            .then((value) {
                                          setState(() {
                                            isOpen = false;
                                          });
                                        }).catchError((onError) {
                                          print('oh no $onError');
                                          showAlertDialog(
                                              translate("Tasks.alert5"),
                                              translate("Tasks.alert6"),
                                              false,
                                              themeNotifier.isDark);
                                        });
                                      }),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Positioned(
                                  child: SizedBox(
                                    width: 340,
                                    height: 180,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 2,
                                        shadowColor: themeNotifier.isDark
                                            ? Colors.black
                                            : Colors.grey.withOpacity(0.5),
                                        primary:
                                            Color.fromARGB(255, 125, 164, 243),
                                        padding: EdgeInsets.all(15),
                                        shape: StadiumBorder(),
                                      ),
                                      child: Wrap(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(translate("Tasks.Save"),
                                              style: TextStyle(
                                                  fontSize: 42,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0))),
                                        ],
                                      ),
                                      onPressed: () async {
                                        var status =
                                            await Permission.storage.status;

                                        if (status.isGranted &&
                                            projectname != "") {
                                          try {
                                            await KMLGenerator.generateKML(
                                                kml.mount(), projectname);
                                            showAlertDialog(
                                                translate("Tasks.alert"),
                                                translate("Tasks.alert2"),
                                                true,
                                                themeNotifier.isDark);
                                          } catch (e) {
                                            print('error $e');
                                            showAlertDialog(
                                                translate("Tasks.alert3"),
                                                translate("Tasks.alert4"),
                                                false,
                                                themeNotifier.isDark);
                                          }
                                        } else {
                                          var isGranted = await Permission
                                              .storage
                                              .request()
                                              .isGranted;
                                          if (isGranted && projectname != "") {
                                            // download kml
                                            try {
                                              await KMLGenerator.generateKML(
                                                  kml.mount(), projectname);
                                              showAlertDialog(
                                                  translate("Tasks.alert"),
                                                  translate("Tasks.alert2"),
                                                  true,
                                                  themeNotifier.isDark);
                                            } catch (e) {
                                              print('error $e');
                                              showAlertDialog(
                                                  translate("Tasks.alert3"),
                                                  translate("Tasks.alert4"),
                                                  false,
                                                  themeNotifier.isDark);
                                            }
                                          } else {
                                            showAlertDialog(
                                                translate("Tasks.alert3"),
                                                translate("Tasks.alert4"),
                                                false,
                                                themeNotifier.isDark);
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 340,
                                  height: 180,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 2,
                                        shadowColor: themeNotifier.isDark
                                            ? Colors.black
                                            : Colors.grey.withOpacity(0.5),
                                        primary:
                                            Color.fromARGB(255, 240, 226, 103),
                                        padding: EdgeInsets.all(15),
                                        shape: StadiumBorder(),
                                      ),
                                      child: Wrap(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(translate("Tasks.Reboot"),
                                              style: TextStyle(
                                                  fontSize: 42,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0))),
                                        ],
                                      ),
                                      onPressed: () {
                                        // send to LG
                                        LGConnection().rebootLG().then((value) {
                                          setState(() {
                                            isOpen = false;
                                          });
                                        }).catchError((onError) {
                                          print('oh no $onError');
                                          showAlertDialog(
                                              translate("Tasks.alert5"),
                                              translate("Tasks.alert6"),
                                              false,
                                              themeNotifier.isDark);
                                        });
                                      }),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 340,
                                  height: 180,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 2,
                                        shadowColor: themeNotifier.isDark
                                            ? Colors.black
                                            : Colors.grey.withOpacity(0.5),
                                        primary:
                                            Color.fromARGB(255, 229, 102, 229),
                                        padding: EdgeInsets.all(15),
                                        shape: StadiumBorder(),
                                      ),
                                      child: Wrap(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(translate("Tasks.Clean"),
                                              style: TextStyle(
                                                  fontSize: 42,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0))),
                                        ],
                                      ),
                                      onPressed: () {
                                        // send to LG

                                        LGConnection()
                                            .cleanVisualization()
                                            .then((value) {
                                          LGConnection().cleanBalloon();
                                          setState(() {
                                            isOpen = false;
                                          });
                                        }).catchError((onError) {
                                          print('oh no $onError');
                                          showAlertDialog(
                                              translate("Tasks.alert5"),
                                              translate("Tasks.alert6"),
                                              false,
                                              themeNotifier.isDark);
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class LGConnection {
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

  Future relaunchLG() async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );

    try {
      await client.connect();
      await client.execute(
          "'/home/${credencials['username']}/bin/lg-relaunch' > /home/${credencials['username']}/log.txt");
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  Future shutdownLG() async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );

    try {
      await client.connect();
      await client.execute(
          "'/home/${credencials['username']}/bin/lg-poweroff' > /home/${credencials['username']}/log.txt");
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  Future rebootLG() async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );

    try {
      await client.connect();
      await client.execute(
          "'/home/${credencials['username']}/bin/lg-reboot' > /home/${credencials['username']}/log.txt");
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

  Future cleanBalloon() async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );
    String rigs = "3";
    rigs = ((int.parse(credencials['numberofrigs']) + 1) / 2).toString();
    try {
      await client.connect();
      return await client
          .execute("echo '' > /var/www/html/kml/slave_$rigs.kml");
    } catch (e) {
      return Future.error(e);
    }
  }
}
