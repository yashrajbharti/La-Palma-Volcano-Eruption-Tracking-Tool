import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:webscrapperapp/codingapp/kmlcreate.dart';
import 'package:webscrapperapp/codingapp/kml/kml.dart';
import 'package:webscrapperapp/codingapp/kml/kmlgenerator.dart';

import 'package:flutter/services.dart';

import 'package:webscrapperapp/codingapp/kml/flyto.dart';
import 'package:webscrapperapp/codingapp/kml/LookAt.dart';
import 'package:webscrapperapp/codingapp/kml/Placemark.dart';
import 'package:webscrapperapp/codingapp/kml/imageprocessing.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:developer';
// ignore: import_of_legacy_library_into_null_safe
import 'package:ssh/ssh.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

class SendtoLG extends StatefulWidget {
  SendtoLG({Key? key}) : super(key: key);

  @override
  State<SendtoLG> createState() => _SendtoLGState();
}

String kmltext = "";
String localpath = "";
bool isOpen = false;
String projectname = "a";

Future<String> _read() async {
  try {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/kmls.txt');
    localpath = '${directory.path}/kmls.txt';
    kmltext = await file.readAsString();
  } catch (e) {
    print("Couldn't read file");
  }
  return kmltext;
}

KML kml = KML(projectname, kmltext);

class _SendtoLGState extends State<SendtoLG> {
  showAlertDialog(String title, String msg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$title'),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            content: Text('$msg'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            child: const Text(
              'Read KML',
              style: TextStyle(fontSize: 25),
            ),
            onPressed: () {
              _read();
            }),
        ElevatedButton(
            child: const Text(
              'Download KML!',
              style: TextStyle(fontSize: 25),
            ),
            onPressed: () async {
              var status = await Permission.storage.status;

              if (status.isGranted) {
                try {
                  await KMLGenerator.generateKML(kml.mount(), "a");
                  showAlertDialog('Success!',
                      'You can find a KML containing the map data of the project in your Downloads folder');
                } catch (e) {
                  print('error $e');
                  showAlertDialog('Oops!',
                      'You have to enable storage managing permissions to download the project KML');
                }
              } else {
                var isGranted = await Permission.storage.request().isGranted;
                if (isGranted) {
                  // download kml
                  try {
                    await KMLGenerator.generateKML(kml.mount(), "a");
                    showAlertDialog('Success!',
                        'You can find a KML containing the map data of the project in your Downloads folder');
                  } catch (e) {
                    print('error $e');
                    showAlertDialog('Oops!',
                        'You have to enable storage managing permissions to download the project KML');
                  }
                } else {
                  showAlertDialog('Oops!',
                      'You have to enable storage managing permissions to download the project KML');
                }
              }
            }),
        ElevatedButton(
            child: const Text(
              'Clean KML',
              style: TextStyle(fontSize: 25),
            ),
            onPressed: () {
              // send to LG
              LGConnection().cleanVisualization().then((value) {
                setState(() {
                  isOpen = false;
                });
              }).catchError((onError) {
                print('oh no $onError');
                showAlertDialog('Error launching!',
                    'An error occurred while trying to connect to LG');
              });
            }),
        ElevatedButton(
            child: const Text(
              'Visualize in LG!',
              style: TextStyle(fontSize: 25),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            onPressed: () {
              // send to LG

              LGConnection().sendToLG(kml.mount(), projectname).then((value) {
                LGConnection().buildOrbit(kml.mount());
                setState(() {
                  isOpen = true;
                });
              }).catchError((onError) {
                print('oh no $onError');
                if (onError == 'nogeodata') {
                  showAlertDialog('No GeoData',
                      'It looks like you haven\'t added any geodata to this project.');
                }
                showAlertDialog('Error launching!',
                    'An error occurred while trying to connect to LG');
              });
            }),
      ],
    );
  }
}

class LGConnection {
  openDemoLogos() async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: "lg",
      passwordOrKey: '${credencials['pass']}',
    );

    String openLogoKML = '''
<?xml version="1.0" encoding="UTF-8"?>
  <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>Ras-logos</name>
        <Folder>
        <name>Logos</name>
        <ScreenOverlay>
        <name>Logo</name>
        <Icon>
        <href>https://i.imgur.com/sDsdizm.png</href>
        </Icon>
        <overlayXY x="0" y="1" xunits="fraction" yunits="fraction"/>
        <screenXY x="0.02" y="0.95" xunits="fraction" yunits="fraction"/>
        <rotationXY x="0" y="0" xunits="fraction" yunits="fraction"/>
        <size x="0.4" y="0.2" xunits="fraction" yunits="fraction"/>
        </ScreenOverlay>
        </Folder>
    </Document>
  </kml>
    ''';
    try {
      await client.connect();
      await client
          .execute("echo '$openLogoKML' > /var/www/html/kml/slave_4.kml");
    } catch (e) {
      print(e);
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
      username: "lg",
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

    return {
      "ip": ipAddress,
      "pass": password,
      "port": portNumber,
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

    return _uploadToLG('$localPath/$projectname.kml', projectname);
  }

  _createLocalImage(String imgName, String assetsUrl) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String imgPath = '${directory.path}/$imgName';
    ByteData data = await rootBundle.load(assetsUrl);
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(imgPath).writeAsBytes(bytes);
    return imgPath;
  }

  _uploadToLG(String localPath, String projectname) async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: "lg",
      passwordOrKey: '${credencials['pass']}',
    );

    LookAt flyto = LookAt(
      -17.8914,
      28.5951,
      '64492.665945696469',
      '35',
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
      username: "lg",
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
      username: "lg",
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

  stopOrbit() async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: "lg",
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
