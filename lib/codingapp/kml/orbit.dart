import 'package:LaPalmaVolcanoEruptionTrackingTool/codingapp/kml/LookAt.dart';

class Orbit {
  static generateOrbitTag(LookAt marker) {
    double heading = double.parse(marker.heading);
    int orbit = 0;
    String content = '';
    String range = '800';

    while (orbit <= 36) {
      if (heading >= 360) heading -= 360;
      content += '''
            <gx:FlyTo>
              <gx:duration>1.2</gx:duration>
              <gx:flyToMode>smooth</gx:flyToMode>
              <LookAt>
                  <longitude>${marker.lng}</longitude>
                  <latitude>${marker.lat}</latitude>
                  <heading>$heading</heading>
                  <tilt>60</tilt>
                  <altitude>6341.7995674</altitude>
                  <gx:fovy>35</gx:fovy>
                  <range>${range}</range>
                  <gx:altitudeMode>absolute</gx:altitudeMode>
              </LookAt>
            </gx:FlyTo>
          ''';
      heading += 10;
      orbit += 1;
    }
    return content;
  }

  static buildOrbit(String content) {
    String kmlOrbit = '''
<?xml version="1.0" encoding="UTF-8"?>
      <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
        <gx:Tour>
          <name>Orbit</name>
          <gx:Playlist> 
            $content
          </gx:Playlist>
        </gx:Tour>
      </kml>
    ''';
    return kmlOrbit;
  }
}
