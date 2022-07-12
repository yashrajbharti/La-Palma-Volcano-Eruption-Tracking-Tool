import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async' show Future;
import 'dart:developer';
// ignore: import_of_legacy_library_into_null_safe
import 'package:ssh/ssh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:webscrapperapp/codingapp/theme-storage.dart';
import 'package:webscrapperapp/codingapp/kml/kml.dart';
import 'package:webscrapperapp/codingapp/kml/LookAt.dart';
import 'package:webscrapperapp/codingapp/menuOptions/lg_tasks.dart';
import 'package:webscrapperapp/codingapp/Tabs/Info.dart';

class SendtoLG extends StatefulWidget {
  SendtoLG({Key? key}) : super(key: key);

  @override
  State<SendtoLG> createState() => _SendtoLGState();
}

List<String> kmltext = ['', '', '', '', '', '', '', ''];
String localpath = "";
bool isOpen = false;
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
// List<String> localimages = [
//   "vent.png",
//   "red_sq.png",
//   "yellow_sq.png",
//   "black_sq.png"
// ];

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
  showAlertDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 4, sigmaY: 3),
            child: AlertDialog(
              backgroundColor: Color.fromARGB(255, 33, 33, 33),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 15),
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

  void _showToast(String x) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "$x",
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
              fontFamily: "OldStandard",
              color: Colors.white),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: ui.Color.fromARGB(250, 43, 43, 43),
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
                                  : Colors.grey.withOpacity(0.5),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15),
                            ),
                            onPressed: () async {
                              savekml_Task(projectname[0]);
                              await _read(0);
                              jumpToPage(0);
                              _showToast(translate('Track.ready'));
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
                                  : Colors.grey.withOpacity(0.5),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15),
                            ),
                            onPressed: () async {
                              savekml_Task(projectname[1]);
                              await _read(1);
                              jumpToPage(1);
                              _showToast(translate('Track.ready'));
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
                                  : Colors.grey.withOpacity(0.5),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15)),
                          onPressed: () async {
                            savekml_Task(projectname[2]);
                            await _read(2);
                            jumpToPage(2);
                            _showToast(translate('Track.ready'));
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
                                  : Colors.grey.withOpacity(0.5),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15)),
                          onPressed: () async {
                            savekml_Task(projectname[3]);
                            await _read(3);
                            jumpToPage(3);
                            _showToast(translate('Track.ready'));
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
                                  : Colors.grey.withOpacity(0.5),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15),
                            ),
                            onPressed: () async {
                              savekml_Task(projectname[4]);
                              await _read(4);
                              jumpToPage(4);
                              _showToast(translate('Track.ready'));
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
                                  : Colors.grey.withOpacity(0.5),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15),
                            ),
                            onPressed: () async {
                              savekml_Task(projectname[5]);
                              await _read(5);
                              jumpToPage(5);
                              _showToast(translate('Track.ready'));
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
                                  : Colors.grey.withOpacity(0.5),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15)),
                          onPressed: () async {
                            savekml_Task(projectname[6]);
                            await _read(6);
                            jumpToPage(6);
                            _showToast(translate('Track.ready'));
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
                                  : Colors.grey.withOpacity(0.5),
                              primary: themeNotifier.isDark
                                  ? ui.Color.fromARGB(255, 43, 43, 43)
                                  : ui.Color.fromARGB(255, 220, 220, 220),
                              padding: EdgeInsets.all(15)),
                          onPressed: () async {
                            savekml_Task(projectname[7]);
                            await _read(7);
                            jumpToPage(7);
                            _showToast(translate('Track.ready'));
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
                  SizedBox(
                    width: 360,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          shadowColor: themeNotifier.isDark
                              ? Colors.black
                              : Colors.grey.withOpacity(0.5),
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
                          LGConnection()
                              .sendToLG(kml.mount(), finalname)
                              .then((value) {
                            _showToast(translate('Track.Visualize'));

                            setState(() {
                              isOpen = true;
                            });
                            DefaultTabController.of(context)?.animateTo(2);
                          }).catchError((onError) {
                            print('oh no $onError');
                            if (onError == 'nogeodata') {
                              showAlertDialog(translate('Track.alert'),
                                  translate('Track.alert2'));
                            }
                            showAlertDialog(translate('Track.alert3'),
                                translate('Track.alert4'));
                          });
                        }),
                  ),
                ],
              ),
            ));
  }
}

class LGConnection {
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
          ? -17.841486
          : projectname == "Located_Events"
              ? -17.834886
              : projectname == "SO2_Emission"
                  ? -7.561565
                  : projectname == "Prehistoric_Track"
                      ? -17.841486
                      : projectname == "Lava_Flow"
                          ? -17.892286
                          : -17.895486,
      projectname == "Historic_Track"
          ? 28.548478
          : projectname == "Located_Events"
              ? 28.564986
              : projectname == "SO2_Emission"
                  ? 33.561245
                  : projectname == "Prehistoric_Track"
                      ? 28.548478
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
                  ? '${135208.997837 / int.parse(credencials['numberofrigs'])}'
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
          ? '15'
          : projectname == "SO2_Emission"
              ? '25'
              : projectname == "Prehistoric_Track"
                  ? '15'
                  : '45',
      '0',
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
