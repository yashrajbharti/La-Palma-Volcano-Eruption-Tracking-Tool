import 'dart:async';
import 'dart:math';
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
  int rigcount = 5;
  double zoomvalue = 591657550.500000 / pow(2, 10.8);
  double latvalue = 28.6599744;
  double longvalue = -17.8984565;
  double tiltvalue = 0;
  double bearingvalue = 0; // 2D angle

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
      zoomvalue = (591657550.500000 / pow(2, 10.8));
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
      "${zoomvalue / rigcount}",
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
            //method called when map is created
            setState(() {
              mapController = controller;
            });
          },
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 10.8,
          ),
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
        )
      ],
    );
  }
}
