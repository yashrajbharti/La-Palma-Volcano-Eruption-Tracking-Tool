import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ssh2/ssh2.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:provider/provider.dart';
import 'package:voltrac/codingapp/kml/LookAt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voltrac/codingapp/kml/orbit.dart';
// import 'package:voltrac/codingapp/theme-storage.dart';

void main() => runApp(MyMap());

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> with SingleTickerProviderStateMixin {
  static LatLng _center = const LatLng(28.65665656297236, -17.885454520583153);
  // late AnimationController _rotationiconcontroller;
  final Set<Marker> _markers = {};
  GoogleMapController? mapController;
  MapType _currentMapType = MapType.satellite;
  bool isOrbiting = false;
  // bool isDemoActive = false;
  int rigcount = 5;
  double zoomvalue = 591657550.500000 / pow(2, 13.15393352508545);
  double latvalue = 28.65665656297236;
  double longvalue = -17.885454520583153;
  double tiltvalue = 41.82725143432617;
  double bearingvalue = 61.403038024902344; // 2D angle

  bool blackandwhite = false;

  // @override
  // void initState() {
  //   _rotationiconcontroller = AnimationController(
  //     duration: const Duration(seconds: 50),
  //     vsync: this,
  //   );
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _rotationiconcontroller.dispose();
  //   super.dispose();
  // }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.satellite
          ? MapType.normal
          : MapType.satellite;
    });
  }

  void _ongpsfixedButtonPressed() {
    setState(() {
      _fixposition();
      zoomvalue = (591657550.500000 / pow(2, 13.15393352508545));
      LatLng newlatlang = _center;
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: newlatlang,
              zoom: 13.15393352508545,
              tilt: 41.82725143432617,
              bearing: 61.403038024902344),
        ),
      );
    });
  }

  void _controlsbuttonPressed(double updownflag, double rightleftflag,
      double zoomflag, double tiltflag, double bearingflag) {
    setState(() {
      LatLng newlatlang = LatLng(updownflag, rightleftflag);
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: newlatlang,
              zoom: zoomflag,
              tilt: tiltflag,
              bearing: bearingflag),
        ),
      );
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
    setState(() {
      isOrbiting = true;
    });
  }

  stopOrbit() async {
    await LGConnection().stopOrbit();
    setState(() {
      isOrbiting = false;
    });
  }

  _getCredentials() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String ipAddress = preferences.getString('master_ip') ?? '';
    String password = preferences.getString('master_password') ?? '';
    String portNumber = preferences.getString('master_portNumber') ?? '';
    String username = preferences.getString('master_username') ?? '';
    String numberofrigs = preferences.getString('numberofrigs') ?? '';
    rigcount = int.parse(numberofrigs);

    return {
      "ip": ipAddress,
      "pass": password,
      "port": portNumber,
      "username": username,
      "numberofrigs": numberofrigs
    };
  }

  // void _showToast(String x, bool blackandwhite) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(
  //         "$x",
  //         style: TextStyle(
  //             fontSize: 24.0,
  //             fontWeight: FontWeight.normal,
  //             fontFamily: "GoogleSans",
  //             color: Colors.white),
  //       ),
  //       duration: Duration(seconds: 3),
  //       backgroundColor: blackandwhite
  //           ? Color.fromARGB(255, 22, 22, 22)
  //           : Color.fromARGB(250, 43, 43, 43),
  //       width: 500.0,
  //       padding: const EdgeInsets.fromLTRB(
  //         35,
  //         20,
  //         15,
  //         20,
  //       ),
  //       behavior: SnackBarBehavior.floating,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //       ),
  //       action: SnackBarAction(
  //         textColor: Color.fromARGB(255, 125, 164, 243),
  //         label: translate('Track.close'),
  //         onPressed: () {},
  //       ),
  //     ),
  //   );
  // }

  showAlertDialog(String title, String msg, bool blackandwhite) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 3),
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
                                  primary: Color.fromARGB(255, 220, 220, 220),
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

  _fixposition() async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );

    LookAt flyto = LookAt(
      -17.885454520583153,
      28.65665656297236,
      "${zoomvalue / rigcount}",
      "41.82725143432617",
      "61.403038024902344",
    );
    try {
      await client.connect();
      await client.execute(
          'echo "flytoview=${flyto.generateLinearString()}" > /tmp/query.txt');
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  motionControls(double updownflag, double rightleftflag, double zoomflag,
      double tiltflag, double bearingflag) async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );

    LookAt flyto = LookAt(rightleftflag, updownflag, zoomflag.toString(),
        tiltflag.toString(), bearingflag.toString());
    try {
      await client.connect();
      await client.execute(
          'echo "flytoview=${flyto.generateLinearString()}" > /tmp/query.txt');
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  void _onCameraMove(CameraPosition position) {
    bearingvalue = position.bearing; // 2D angle
    longvalue = position.target.longitude; // lat lng
    latvalue = position.target.latitude;
    tiltvalue = position.tilt; // 3D angle
    zoomvalue = 591657550.500000 / pow(2, position.zoom);
  }

  void _onCameraIdle() {
    motionControls(
        latvalue, longvalue, zoomvalue / rigcount, tiltvalue, bearingvalue);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
            new Factory<OneSequenceGestureRecognizer>(
              () => new EagerGestureRecognizer(),
            ),
          ].toSet(),
          onMapCreated: (controller) {
            _getCredentials();
            //method called when map is created
            setState(() {
              mapController = controller;
            });
          },
          initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 13.15393352508545,
              bearing: bearingvalue,
              tilt: tiltvalue),
          minMaxZoomPreference: MinMaxZoomPreference.unbounded,
          tiltGesturesEnabled: true,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: true,
          scrollGesturesEnabled: true,
          compassEnabled: true,
          mapType: _currentMapType,
          markers: _markers,
          onCameraMove: _onCameraMove,
          onCameraIdle: _onCameraIdle,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                SizedBox(height: 57.0),
                FloatingActionButton(
                  heroTag: "btn1",
                  onPressed: _onMapTypeButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Color.fromARGB(255, 75, 127, 82),
                  child: const Icon(
                    Icons.map,
                    size: 36.0,
                    color: Color.fromARGB(255, 204, 204, 204),
                  ),
                ),
                SizedBox(height: 16.0),
                FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: _ongpsfixedButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Color.fromARGB(255, 75, 127, 82),
                  child: const Icon(
                    Icons.gps_fixed_rounded,
                    size: 36.0,
                    color: Color.fromARGB(255, 204, 204, 204),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 80,
          right: 20,
          child: Card(
            elevation: 0,
            child: Container(
              color: Color.fromARGB(255, 68, 68, 68),
              width: 59.5,
              height: 124.25,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 6),
                  IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 204, 204, 204),
                        size: 32,
                      ),
                      onPressed: () async {
                        var currentZoomLevel =
                            await mapController?.getZoomLevel();

                        currentZoomLevel = (currentZoomLevel! + 1);

                        _controlsbuttonPressed(latvalue, longvalue,
                            currentZoomLevel, tiltvalue, bearingvalue);

                        mapController?.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                                target: LatLng(latvalue, longvalue),
                                zoom: currentZoomLevel,
                                bearing: bearingvalue,
                                tilt: tiltvalue),
                          ),
                        );
                      }),
                  Divider(),
                  IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 32,
                        color: Color.fromARGB(255, 204, 204, 204),
                      ),
                      onPressed: () async {
                        var currentZoomLevel =
                            await mapController?.getZoomLevel();
                        currentZoomLevel = currentZoomLevel! - 1;

                        _controlsbuttonPressed(latvalue, longvalue,
                            currentZoomLevel, tiltvalue, bearingvalue);
                        if (currentZoomLevel < 0) currentZoomLevel = 0;

                        mapController?.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                                target: LatLng(latvalue, longvalue),
                                zoom: currentZoomLevel,
                                bearing: bearingvalue,
                                tilt: tiltvalue),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
        // Consumer<ThemeModel>(
        //     builder: (context, ThemeModel themeNotifier, child) => Positioned(
        //           bottom: 88,
        //           left: 20,
        //           height: 300,
        //           child: RotatedBox(
        //               quarterTurns: 1,
        //               child: SliderTheme(
        //                   data: SliderTheme.of(context).copyWith(
        //                     trackShape: RectangularSliderTrackShape(),
        //                     valueIndicatorColor: themeNotifier.isDark
        //                         ? Color.fromARGB(255, 24, 24, 24)
        //                         : Color.fromARGB(255, 104, 104, 104),
        //                   ),
        //                   child: Slider(
        //                     value: _currentSliderValue,
        //                     max: 100,
        //                     inactiveColor: Color.fromARGB(255, 75, 127, 82),
        //                     thumbColor: Color.fromARGB(55, 68, 68, 68),
        //                     activeColor: Color.fromARGB(255, 24, 24, 24),
        //                     divisions: 100,
        //                     label:
        //                         (100 - _currentSliderValue.round()).toString() +
        //                             "% \u{1f554}",
        //                     onChanged: (double value) {
        //                       setState(() {
        //                         _currentSliderValue = value;
        //                       });
        //                     },
        //                   ))),
        //         )),
        // Consumer<ThemeModel>(
        //   builder: (context, ThemeModel themeNotifier, child) => Positioned(
        //     top: 58,
        //     left: 7,
        //     child: Column(
        //       children: <Widget>[
        //         SizedBox(height: 6),
        //         Builder(
        //           builder: (context) => IconButton(
        //               icon: Image.asset('assets/icons/DataKML.png'),
        //               iconSize: 57,
        //               onPressed: () => {
        //                     isDemoActive = !isDemoActive,
        //                     if (isDemoActive == true)
        //                       {
        //                         LGConnection().openDemoLogos().then((value) {
        //                           _showToast(translate('map.demostart'),
        //                               themeNotifier.isDark);
        //                         }).catchError((onError) {
        //                           print('oh no $onError');
        //                           if (onError == 'nogeodata') {
        //                             showAlertDialog(
        //                                 translate('Track.alert'),
        //                                 translate('Track.alert2'),
        //                                 themeNotifier.isDark);
        //                           }
        //                           showAlertDialog(
        //                               translate('Track.alert3'),
        //                               translate('Track.alert4'),
        //                               themeNotifier.isDark);
        //                         }),
        //                       }
        //                     else
        //                       {
        //                         LGConnection()
        //                             .cleanVisualization()
        //                             .then((value) {
        //                           _showToast(translate('map.demostop'),
        //                               themeNotifier.isDark);
        //                         }).catchError((onError) {
        //                           print('oh no $onError');
        //                           if (onError == 'nogeodata') {
        //                             showAlertDialog(
        //                                 translate('Track.alert'),
        //                                 translate('Track.alert2'),
        //                                 themeNotifier.isDark);
        //                           }
        //                           showAlertDialog(
        //                               translate('Track.alert3'),
        //                               translate('Track.alert4'),
        //                               themeNotifier.isDark);
        //                         }),
        //                       }
        //                   }),
        //         ),
        //         RotationTransition(
        //           turns: Tween(begin: 0.0, end: 25.0)
        //               .animate(_rotationiconcontroller),
        //           child: Builder(
        //             builder: (context) => IconButton(
        //               icon: Image.asset('assets/icons/orbit.png'),
        //               iconSize: 57,
        //               onPressed: () => {
        //                 isOrbiting = !isOrbiting,
        //                 if (isOrbiting == true)
        //                   {
        //                     _rotationiconcontroller.forward(),
        //                     playOrbit().then((value) {
        //                       _showToast(translate('map.buildorbit'),
        //                           themeNotifier.isDark);
        //                     }).catchError((onError) {
        //                       _rotationiconcontroller.stop();
        //                       print('oh no $onError');
        //                       if (onError == 'nogeodata') {
        //                         showAlertDialog(
        //                             translate('Track.alert'),
        //                             translate('Track.alert2'),
        //                             themeNotifier.isDark);
        //                       }
        //                       showAlertDialog(
        //                           translate('Track.alert3'),
        //                           translate('Track.alert4'),
        //                           themeNotifier.isDark);
        //                     }),
        //                   }
        //                 else
        //                   {
        //                     _rotationiconcontroller.reset(),
        //                     stopOrbit().then((value) {
        //                       _showToast(translate('map.stoporbit'),
        //                           themeNotifier.isDark);
        //                       LGConnection().cleanOrbit();
        //                       LGConnection().cleanVisualization();
        //                     }).catchError((onError) {
        //                       print('oh no $onError');
        //                       if (onError == 'nogeodata') {
        //                         showAlertDialog(
        //                             translate('Track.alert'),
        //                             translate('Track.alert2'),
        //                             themeNotifier.isDark);
        //                       }
        //                       showAlertDialog(
        //                           translate('Track.alert3'),
        //                           translate('Track.alert4'),
        //                           themeNotifier.isDark);
        //                     }),
        //                   }
        //               },
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }
}

class LGConnection {
//   openDemoLogos() async {
//     String openLogoKML = '''
// <?xml version="1.0" encoding="UTF-8"?>
// <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
// <Document>
// 	<name>VolTrac</name>
// 	<open>1</open>
// 	<description>The logo is located in the bottom left hand corner</description>
// 	<Folder>
// 		<name>tags</name>
// 		<Style>
// 			<ListStyle>
// 				<listItemType>checkHideChildren</listItemType>
// 				<bgColor>00ffffff</bgColor>
// 				<maxSnippetLines>2</maxSnippetLines>
// 			</ListStyle>
// 		</Style>
//     <GroundOverlay>
// 			<name>la palma map</name>
// 			<Icon>
// 				<href>https://raw.githubusercontent.com/yashrajbharti/kml-images/main/lapalmamap.png</href>
// 				<viewBoundScale>0.75</viewBoundScale>
// 			</Icon>
// 			<LatLonBox>
// 				<north>28.8870042553608</north>
// 				<south>28.40912829496716</south>
// 				<east>-17.57873634021623</east>
// 				<west>-18.08819223363864</west>
// 				<rotation>1.062017917633057</rotation>
// 			</LatLonBox>
// 		</GroundOverlay>
// 		<GroundOverlay>
// 			<name>la palma text</name>
// 			<Icon>
// 				<href>https://raw.githubusercontent.com/yashrajbharti/kml-images/main/lapalma.png</href>
// 				<viewBoundScale>0.75</viewBoundScale>
// 			</Icon>
// 			<LatLonBox>
// 				<north>28.52252385807398</north>
// 				<south>28.44456085195286</south>
// 				<east>-17.59700656934779</east>
// 				<west>-17.77481317561376</west>
// 			</LatLonBox>
// 		</GroundOverlay>
// 		<GroundOverlay>
// 			<name>liquid galaxy</name>
// 			<Icon>
// 				<href>https://raw.githubusercontent.com/yashrajbharti/kml-images/main/liquidgalaxy.png</href>
// 				<viewBoundScale>0.75</viewBoundScale>
// 			</Icon>
// 			<LatLonBox>
// 				<north>28.69142438238073</north>
// 				<south>28.62818579232439</south>
// 				<east>-17.98593493888748</east>
// 				<west>-18.07865569375839</west>
// 				<rotation>3.219670295715332</rotation>
// 			</LatLonBox>
// 		</GroundOverlay>
// 		<GroundOverlay>
// 			<name>summer of code</name>
// 			<Icon>
// 				<href>https://raw.githubusercontent.com/yashrajbharti/kml-images/main/summerofcodelogo.png</href>
// 				<viewBoundScale>0.75</viewBoundScale>
// 			</Icon>
// 			<LatLonBox>
// 				<north>28.50474467934734</north>
// 				<south>28.45647880492179</south>
// 				<east>-17.97117321011799</east>
// 				<west>-18.02808983602195</west>
// 				<rotation>1.852455482014185</rotation>
// 			</LatLonBox>
// 		</GroundOverlay>
// 		<GroundOverlay>
// 			<name>summer of code text</name>
// 			<Icon>
// 				<href>https://raw.githubusercontent.com/yashrajbharti/kml-images/main/summerofcodetext.png</href>
// 				<viewBoundScale>0.75</viewBoundScale>
// 			</Icon>
// 			<LatLonBox>
// 				<north>28.45765069582156</north>
// 				<south>28.42737297924874</south>
// 				<east>-17.95280851216312</east>
// 				<west>-18.0438498095042</west>
// 				<rotation>1.264564394950867</rotation>
// 			</LatLonBox>
// 		</GroundOverlay>
// 	</Folder>
// </Document>
// </kml>''';
//     return _createLocalFile(openLogoKML, "logo");
//   }

//   _createLocalFile(String kml, String projectname) async {
//     String localPath = await _localPath;
//     File localFile = File('$localPath/$projectname.kml');
//     localFile.writeAsString(kml);
//     File localFile2 = File('$localPath/kmls.txt');
//     localFile2.writeAsString(kml);
//     return _uploadToLG('$localPath/$projectname.kml', projectname);
//   }

//   _uploadToLG(String localPath, String projectname) async {
//     dynamic credencials = await _getCredentials();

//     SSHClient client = SSHClient(
//       host: '${credencials['ip']}',
//       port: int.parse('${credencials['port']}'),
//       username: '${credencials['username']}',
//       passwordOrKey: '${credencials['pass']}',
//     );

//     LookAt flyto = LookAt(
//       -17.895486,
//       28.610478,
//       '${75208.9978371 / int.parse(credencials['numberofrigs'])}',
//       '45',
//       '0',
//     );
//     try {
//       await client.connect();
//       await client.execute('> /var/www/html/kmls.txt');

//       // upload kml
//       await client.connectSFTP();
//       await client.sftpUpload(
//         path: localPath,
//         toPath: '/var/www/html',
//         callback: (progress) {
//           print('Sent $progress');
//         },
//       );
//       await client.execute(
//           'echo "http://lg1:81/$projectname.kml" > /var/www/html/kmls.txt');

//       return await client.execute(
//           'echo "flytoview=${flyto.generateLinearString()}" > /tmp/query.txt');
//     } catch (e) {
//       print('Could not connect to host LG');
//       return Future.error(e);
//     }
//   }

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
}
