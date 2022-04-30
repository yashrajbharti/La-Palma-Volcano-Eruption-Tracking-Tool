import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:developer';
import 'package:webscrapperapp/codingapp/kml/LookAt.dart';

String X = "";

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
    <Style id="normal-$i">
      <IconStyle>
        <scale>1</scale>
        <Icon>
          <href>https://i.ibb.co/KVcBqHd/earthquake.png</href>
        </Icon>
        <hotSpot 
          x="0.0" 
          y="0.0" 
          xunits="fraction" 
          yunits="fraction"
        />
      </IconStyle>
    </Style>
    <StyleMap id="$i">
      <Pair>
        <key>normal</key>
        <styleUrl>normal-$i</styleUrl>
      </Pair>
      <Pair>
        <key>highlight</key>
        <styleUrl>high-$i</styleUrl>
      </Pair>
    </StyleMap>
    <Placemark>
      <name>${volcanicData[i]["title"]}</name>
      <description> 
        <![CDATA[
            <h1>Seismic Data</h1>
            <p><font color="orange">Magnitude of Earthquake ${magnitude[i]["title"]} mbLg.</font></p>
          ]]>
      </description>
      <styleUrl>$i</styleUrl>
       <Point>
        <gx:drawOrder>1</gx:drawOrder>
        <coordinates>${longitude[i]["title"]},${latitude[i]["title"]}</coordinates>
      </Point>
    </Placemark>''';
  }

  await file.writeAsString("$X");
  log(await file.readAsString());
}
