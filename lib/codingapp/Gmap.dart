import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webscrapperapp/codingapp/kml/LookAt.dart';
import 'package:webscrapperapp/codingapp/kml/Placemark.dart';
import 'package:webscrapperapp/codingapp/kml/Point.dart';
import 'package:webscrapperapp/codingapp/kml/Polygon.dart' as poly;

class Gmap {
  List<Placemark> markers;
  poly.Polygon areaPolygon;
  Placemark landingPoint;

  Gmap(this.markers, this.areaPolygon, this.landingPoint);

  toMap() {
    List<dynamic> mrks = [];
    markers.forEach((element) {
      mrks.add(element.toMap());
    });

    return {
      "markers": mrks,
      "areaPolygon": areaPolygon.toMap(),
      "landingPoint": landingPoint.toMap(),
    };
  }

  static fromMap(dynamic map) {
    List<Placemark> markers = [];
    poly.Polygon polygon = poly.Polygon('', []);
    Placemark landingPoint;

    if (map['landingPoint'] != null) {
      landingPoint = Placemark(
          map['landingPoint']['id'],
          map['landingPoint']['name'],
          map['landingPoint']['description'],
          LookAt(
              map['landingPoint']['lookAt']['lng'],
              map['landingPoint']['lookAt']['lat'],
              map['landingPoint']['lookAt']['range'],
              map['landingPoint']['lookAt']['tilt'],
              map['landingPoint']['lookAt']['heading']),
          Point(map['landingPoint']['point']['lat'],
              map['landingPoint']['point']['lng']),
          'landingPoint');
    } else {
      landingPoint = Placemark(
          '',
          '',
          '',
          LookAt(
            0,
            0,
            '',
            '',
            '',
          ),
          Point(0, 0),
          'landingPoint');
    }

    if (map != null) {
      if (map['markers'] != null) {
        markers = Placemark.fromMapList(map['markers']);
      }
      if (map['areaPolygon'] != null) {
        List<LatLng> pointList = [];
        map['areaPolygon']['coord'].forEach((element) {
          pointList.add(LatLng(element['lat'], element['long']));
        });
        polygon = poly.Polygon(map['areaPolygon']['id'], pointList);
      }
    }
    return Gmap(markers, polygon, landingPoint);
  }
}
