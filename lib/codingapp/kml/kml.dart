import 'package:webscrapperapp/codingapp/kml/Placemark.dart';
import 'package:webscrapperapp/codingapp/kml/polygon.dart';

class KML {
  String name;
  String content;

  KML(this.name, this.content);

  static buildKMLContent(
      List<Placemark> placemarks, Polygon polygon, Placemark landingPoint) {
    String kmlContent = '';
    if (polygon.coord.length > 0) kmlContent += '\n ${polygon.generateTag()}';
    placemarks.forEach((element) {
      if (element.customData['seed']['commonName'] == 'none') {
        kmlContent += element.generateCommonMarkerTag(
            'http://maps.google.com/mapfiles/kml/paddle/red-circle.png');
      } else {
        kmlContent +=
            '\n ${element.generateTag(element.customData['seed']['icon']['name'])}';
      }
    });

    if (landingPoint.name != 'none') {
      kmlContent += '\n ${landingPoint.generateTag('landpoint.png')}';
    }

    return kmlContent;
  }

  mount() {
    return '''
<?xml version="1.0" encoding="UTF-8"?>
  <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>$name</name>
        <Folder>
        $content
        </Folder>
    </Document>
  </kml>
''';
  }
}
