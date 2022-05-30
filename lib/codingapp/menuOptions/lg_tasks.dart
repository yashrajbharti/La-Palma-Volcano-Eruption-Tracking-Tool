import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';
import 'package:webscrapperapp/codingapp/drawer.dart';
import 'package:webscrapperapp/codingapp/kml/kml.dart';
import 'package:webscrapperapp/codingapp/kml/kmlgenerator.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:ssh/ssh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

class LGtasks extends StatefulWidget {
  LGtasks({Key? key}) : super(key: key);

  @override
  State<LGtasks> createState() => _LGtasksState();
}

String kmltext = "";
String localpath = "";
bool isOpen = false;
String projectname = "";
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
  showAlertDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Color.fromARGB(255, 43, 43, 43),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 204, 204, 204),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.clear_rounded,
                    color: Color.fromARGB(255, 228, 6, 9),
                    size: 32,
                  ),
                  padding: EdgeInsets.only(bottom: 10),
                ),
              ],
            ),
            content: Text(
              '$msg',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
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
      backgroundColor: Color.fromARGB(255, 204, 204, 204),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                translate("Tasks.LG"),
                style: TextStyle(
                  fontSize: 42,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
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
                              elevation: 0.0,
                              shadowColor: Colors.transparent,
                              primary: Color.fromARGB(255, 115, 184, 117),
                              padding: EdgeInsets.all(15),
                              shape: StadiumBorder(),
                            ),
                            child: Wrap(
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Text(translate("Tasks.Relaunch"),
                                    style: TextStyle(fontSize: 42)),
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
                                showAlertDialog(translate("Tasks.alert5"),
                                    translate("Tasks.alert6"));
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
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                primary: Color.fromARGB(255, 232, 108, 99),
                                padding: EdgeInsets.all(15),
                                shape: StadiumBorder(),
                              ),
                              child: Wrap(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(translate("Tasks.Shutdown"),
                                      style: TextStyle(fontSize: 42)),
                                ],
                              ),
                              onPressed: () {
                                // send to LG
                                LGConnection().shutdownLG().then((value) {
                                  setState(() {
                                    isOpen = false;
                                  });
                                }).catchError((onError) {
                                  print('oh no $onError');
                                  showAlertDialog(translate("Tasks.alert5"),
                                      translate("Tasks.alert6"));
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
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                primary: Color.fromARGB(255, 125, 164, 243),
                                padding: EdgeInsets.all(15),
                                shape: StadiumBorder(),
                              ),
                              child: Wrap(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(translate("Tasks.Save"),
                                      style: TextStyle(fontSize: 42)),
                                ],
                              ),
                              onPressed: () async {
                                var status = await Permission.storage.status;

                                if (status.isGranted && projectname != "") {
                                  try {
                                    await KMLGenerator.generateKML(
                                        kml.mount(), projectname);
                                    showAlertDialog(translate("Tasks.alert"),
                                        translate("Tasks.alert2"));
                                  } catch (e) {
                                    print('error $e');
                                    showAlertDialog(translate("Tasks.alert3"),
                                        translate("Tasks.alert4"));
                                  }
                                } else {
                                  var isGranted = await Permission.storage
                                      .request()
                                      .isGranted;
                                  if (isGranted && projectname != "") {
                                    // download kml
                                    try {
                                      await KMLGenerator.generateKML(
                                          kml.mount(), projectname);
                                      showAlertDialog(translate("Tasks.alert"),
                                          translate("Tasks.alert2"));
                                    } catch (e) {
                                      print('error $e');
                                      showAlertDialog(translate("Tasks.alert3"),
                                          translate("Tasks.alert4"));
                                    }
                                  } else {
                                    showAlertDialog(translate("Tasks.alert3"),
                                        translate("Tasks.alert4"));
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
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                primary: Color.fromARGB(255, 240, 226, 103),
                                padding: EdgeInsets.all(15),
                                shape: StadiumBorder(),
                              ),
                              child: Wrap(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(translate("Tasks.Reboot"),
                                      style: TextStyle(fontSize: 42)),
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
                                  showAlertDialog(translate("Tasks.alert5"),
                                      translate("Tasks.alert6"));
                                });
                              }),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 340,
                          height: 180,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                primary: Color.fromARGB(255, 229, 102, 229),
                                padding: EdgeInsets.all(15),
                                shape: StadiumBorder(),
                              ),
                              child: Wrap(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(translate("Tasks.Clean"),
                                      style: TextStyle(fontSize: 42)),
                                ],
                              ),
                              onPressed: () {
                                // send to LG
                                LGConnection()
                                    .cleanVisualization()
                                    .then((value) {
                                  setState(() {
                                    isOpen = false;
                                  });
                                }).catchError((onError) {
                                  print('oh no $onError');
                                  showAlertDialog(translate("Tasks.alert5"),
                                      translate("Tasks.alert6"));
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
    );
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

    return {
      "ip": ipAddress,
      "pass": password,
      "port": portNumber,
      "username": username,
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
}
