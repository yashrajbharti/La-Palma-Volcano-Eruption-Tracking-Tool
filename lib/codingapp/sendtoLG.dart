import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:webscrapperapp/codingapp/kmlcreate.dart';
import 'package:webscrapperapp/codingapp/kml/kml.dart';
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

class _SendtoLGState extends State<SendtoLG> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          child: const Text(
            'View in LG!',
            style: TextStyle(fontSize: 25),
          ),
          onPressed: () {
            _read();
            // send to LG
            // LGConnection().sendToLG(kmltext).then((value) {
            //   setState(() {
            //     isOpen = true;
            //   });
            // }).catchError((onError) {
            //   print('oh no $onError');
            // });
            LGConnection().cleanVisualization();
          }),
    );
  }
}

class LGConnection {
  openDemoLogos() async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: 2222,
      username: "lg",
      passwordOrKey: '${credencials['pass']}',
    );

    // With feh image viewer
    // try {
    //   await client.connect();
    //   await client.execute(
    //       'sshpass -p ${credencials['pass']} ssh lg1 "sudo -S <<< "${credencials['pass']}" sudo apt install feh -yq"');
    //   await client.execute(
    //       'sshpass -p ${credencials['pass']} ssh lg4 "curl https://i.imgur.com/4iHKQpN.jpg?1 > /home/lg/raslogos.png"');
    //   await client
    //       .execute('sshpass -p ${credencials['pass']} ssh lg4 "pkill feh"');
    //   await client.execute(
    //       'sshpass -p ${credencials['pass']} ssh lg4 "export DISPLAY=:0 && feh -x -g 700x700 /home/lg/raslogos.png --zoom fill"');
    // } catch (e) {}

    // With KML on slave 4
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

  Future sendToLG(String kmltext) async {
    if (kmltext.isNotEmpty) {
      return _createLocalFile(kmltext);
    }
    return Future.error('nogeodata');
  }

  Future cleanVisualization() async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: 2222,
      username: "lg",
      passwordOrKey: '${credencials['pass']}',
    );

    try {
      await client.connect();
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

    return {
      "ip": ipAddress,
      "pass": password,
    };
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  _createLocalFile(String kmltext) async {
    String localPath = await _localPath;
    File localFile = File('$localPath/a.kml');
    localFile.writeAsString(kmltext);

    return _uploadToLG('$localPath/a.kml', kmltext);
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

  _uploadToLG(String localPath, String kmltext) async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: 2222,
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

      // upload landpoint asset
      String imgPath = await _createLocalImage('pin.png', 'assets/pin.png');
      await client.sftpUpload(path: imgPath, toPath: '/var/www/html');

      await client
          .execute('echo "http://lg1:81/a.kml" > /var/www/html/kmls.txt');
      return await client.execute(
          'echo "flytoview=${flyto.generateLinearString()}" > /tmp/query.txt');
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }
}







 // return Column(
    //   children: [
    //     ElevatedButton(
    //         child: const Text(
    //           'Read KML',
    //           style: TextStyle(fontSize: 25),
    //         ),
    //         onPressed: () {
    //           _read();
    //         }),
    //     ElevatedButton(
    //         child: const Text(
    //           'View in LG!',
    //           style: TextStyle(fontSize: 25),
    //         ),
    //         onPressed: () {
    //           _read();
    //           // send to LG
    //           LGConnection().sendToLG(kmltext).then((value) {
    //             setState(() {
    //               isOpen = true;
    //             });
    //           }).catchError((onError) {
    //             print('oh no $onError');
    //           });
    //         }),
    //     ElevatedButton(
    //         child: const Text(
    //           'Clean KML',
    //           style: TextStyle(fontSize: 25),
    //         ),
    //         onPressed: () {
    //           _read();
    //           // send to LG
    //           LGConnection().cleanVisualization();
    //         }),
    //   ],
    // );