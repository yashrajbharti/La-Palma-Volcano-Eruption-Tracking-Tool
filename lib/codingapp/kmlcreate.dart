import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:developer';
import 'package:webscrapperapp/codingapp/kml/LookAt.dart';

String X = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>''';

kmlcreate(
    List<Map<String, dynamic>> volcanicData,
    List<Map<String, dynamic>> magnitude,
    List<Map<String, dynamic>> latitude,
    List<Map<String, dynamic>> longitude) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/kmls.txt');
  for (int i = 0; i < volcanicData.length; i++) {
    X = X +
        "\n" +
        '''
      <Icon>
          <href>http://lg1:81/a.kml</href>
        </Icon>
    <Placemark>
      <name>${volcanicData[i]["title"]}</name>
        <description>
          <![CDATA[
            <h1>Seismic Data</h1>
            <p><font color="red">Magnitude of Earthquake ${magnitude[i]["title"]} mbLg.</font></p>
          ]]>
        </description>
        <Point>
          <coordinates>${longitude[i]["title"]},${latitude[i]["title"]}</coordinates>
        </Point>
    </Placemark>''';
  }
  X = X +
      "\n" +
      '''
  </Document>
</kml>''';

  await file.writeAsString("$X");
  log(await file.readAsString());
}
