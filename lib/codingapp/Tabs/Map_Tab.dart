import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:ssh/ssh.dart';
import 'package:webscrapperapp/codingapp/kml/LookAt.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyMap());

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  static LatLng _center = const LatLng(28.6599744, -17.8984565);

  final Set<Marker> _markers = {};
  GoogleMapController? mapController;
  MapType _currentMapType = MapType.satellite;

  double zoomvalue = 100569.665945696469;
  double latvalue = 28.6599744;
  double longvalue = -17.8984565;

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
      zoomvalue = 100569.665945696469;
      LatLng newlatlang = _center;
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: newlatlang,
            zoom: 10.8,
          ),
        ),
      );
    });
  }

  void _controlsbuttonPressed(
      double updownflag, double rightleftflag, double zoomflag) {
    setState(() {
      LatLng newlatlang = LatLng(updownflag, rightleftflag);
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: newlatlang, zoom: zoomflag),
        ),
      );
    });
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

  _fixposition() async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );

    LookAt flyto = LookAt(
      -17.8984565,
      28.6599744,
      '100569.665945696469',
      '0',
      '0',
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

  motionControls(
      double updownflag, double rightleftflag, double zoomflag) async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );

    LookAt flyto = LookAt(
      rightleftflag,
      updownflag,
      '${zoomflag.toString()}',
      '0',
      '0',
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
  // position: _lastMapPosition

  void _onCameraMove(CameraPosition position) {}

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
            //method called when map is created
            setState(() {
              mapController = controller;
            });
          },
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 10.8,
          ),
          zoomControlsEnabled: false,
          zoomGesturesEnabled: true,
          scrollGesturesEnabled: true,
          compassEnabled: true,
          mapType: _currentMapType,
          markers: _markers,
          onCameraMove: _onCameraMove,
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
          bottom: 70,
          left: 20,
          child: Container(
            child: Stack(children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 16, 14),
                  child: IconButton(
                      icon: Icon(
                        Icons.circle,
                        color: Colors.transparent,
                        size: 50,
                      ),
                      onPressed: () async {
                        var currentZoomLevel =
                            await mapController?.getZoomLevel();
                        currentZoomLevel = (currentZoomLevel! + 0);
                        latvalue = latvalue - 0.2;
                        motionControls(latvalue, longvalue, zoomvalue);
                        _controlsbuttonPressed(
                            latvalue, longvalue, currentZoomLevel);
                      }),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 18, 16),
                  child: IconButton(
                      icon: Icon(
                        Icons.circle,
                        color: Colors.transparent,
                        size: 50,
                      ),
                      onPressed: () async {
                        var currentZoomLevel =
                            await mapController?.getZoomLevel();
                        currentZoomLevel = (currentZoomLevel! + 0);
                        latvalue = latvalue + 0.2;
                        motionControls(latvalue, longvalue, zoomvalue);
                        _controlsbuttonPressed(
                            latvalue, longvalue, currentZoomLevel);
                      }),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 16, 18),
                  child: IconButton(
                      icon: Icon(
                        Icons.circle,
                        color: Colors.transparent,
                        size: 50,
                      ),
                      onPressed: () async {
                        var currentZoomLevel =
                            await mapController?.getZoomLevel();
                        currentZoomLevel = (currentZoomLevel! + 0);
                        longvalue = longvalue - 0.2;
                        motionControls(latvalue, longvalue, zoomvalue);
                        _controlsbuttonPressed(
                            latvalue, longvalue, currentZoomLevel);
                      }),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 14, 16),
                  child: IconButton(
                      icon: Icon(
                        Icons.circle,
                        color: Colors.transparent,
                        size: 50,
                      ),
                      onPressed: () async {
                        var currentZoomLevel =
                            await mapController?.getZoomLevel();
                        currentZoomLevel = (currentZoomLevel! + 0);
                        longvalue = longvalue + 0.2;
                        motionControls(latvalue, longvalue, zoomvalue);
                        _controlsbuttonPressed(
                            latvalue, longvalue, currentZoomLevel);
                      }),
                ),
              )
            ]),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/icons/controller.png'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          top: 70,
          left: 20,
          child: Card(
            elevation: 0,
            child: Container(
              color: Color.fromARGB(255, 78, 78, 78),
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
                        if (zoomvalue > 0) {
                          zoomvalue = zoomvalue - 60000;
                          motionControls(latvalue, longvalue, zoomvalue);
                          _controlsbuttonPressed(
                              latvalue, longvalue, currentZoomLevel);
                        } else {
                          zoomvalue = 100;
                          motionControls(latvalue, longvalue, zoomvalue);
                          _controlsbuttonPressed(
                              latvalue, longvalue, currentZoomLevel);
                        }
                        mapController?.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: _center,
                              zoom: currentZoomLevel,
                            ),
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
                        zoomvalue = zoomvalue + 60000;
                        motionControls(latvalue, longvalue, zoomvalue);
                        _controlsbuttonPressed(
                            latvalue, longvalue, currentZoomLevel);
                        if (currentZoomLevel < 0) currentZoomLevel = 0;

                        mapController?.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: _center,
                              zoom: currentZoomLevel,
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
