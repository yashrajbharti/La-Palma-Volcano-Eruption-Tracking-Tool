class TremorBuilder {
  TremorBuilder();
  String tremorstring = '''''';
  String style = '''<Style id="sismo4">
    <IconStyle id="sismoIcon4">
    <scale>0.2</scale>
        <Icon>
            <href>https://raw.githubusercontent.com/yashrajbharti/kml-images/main/IntCat_1.png</href>
        </Icon>
    </IconStyle>
    <LabelStyle>
        <scale>0</scale>
    </LabelStyle>
</Style>
<Style id="sismo3">
    <IconStyle id="sismoIcon3">
    <scale>0.2</scale>
        <Icon>
            <href>https://raw.githubusercontent.com/yashrajbharti/kml-images/main/MagCat_3_red.png</href>
        </Icon>
    </IconStyle>
    <LabelStyle>
        <scale>0</scale>
    </LabelStyle>
</Style>
<Style id="sismo2">
    <IconStyle id="sismoIcon2">
    <scale>0.2</scale>
        <Icon>
            <href>https://raw.githubusercontent.com/yashrajbharti/kml-images/main/MagCat_2_orange.png</href>
        </Icon>
    </IconStyle>
    <LabelStyle>
        <scale>0</scale>
    </LabelStyle>
</Style>
<Style id="sismo1">
    <IconStyle id="sismoIcon1">
    <scale>0.2</scale>
        <Icon>
            <href>https://raw.githubusercontent.com/yashrajbharti/kml-images/main/MagCat_1_lightorange.png</href>
        </Icon>
    </IconStyle>
    <LabelStyle>
        <scale>0</scale>
    </LabelStyle>
</Style>
<Style id="sismo">
    <IconStyle id="sismoIcon">
    <scale>0.2</scale>
        <Icon>
            <href>https://raw.githubusercontent.com/yashrajbharti/kml-images/main/MagCat_0_yellow.png</href>
        </Icon>
    </IconStyle>
    <LabelStyle>
        <scale>0</scale>
    </LabelStyle>
</Style>''';

  generateTag(String date1, String date2, Map<String, dynamic> dmap) {
    for (int i = 0; i < 7646; i++) {
      if (DateTime.parse(date1.toString().split(" ")[0]).compareTo(
                  DateTime.parse(dmap["features"][i]["properties"]["fecha"])) <=
              0 &&
          DateTime.parse(date2.toString().split(" ")[0]).compareTo(
                  DateTime.parse(dmap["features"][i]["properties"]["fecha"])) >=
              0) {
        tremorstring += tremorplacemark(
          dmap["features"][i]["properties"]["localizacion"],
          dmap["features"][i]["properties"]["fecha"],
          dmap["features"][i]["properties"]["hora"],
          dmap["features"][i]["geometry"]["coordinates"][0],
          dmap["features"][i]["geometry"]["coordinates"][1],
          dmap["features"][i]["properties"]["profundidad"],
          dmap["features"][i]["properties"]["intensidad"],
          dmap["features"][i]["properties"]["magnitud"],
        );
      } else if (DateTime.parse(date2.toString().split(" ")[0]).compareTo(
              DateTime.parse(dmap["features"][i]["properties"]["fecha"])) <=
          0) i = 7646;
    }
    return style + tremorstring;
  }

  tremorplacemark(location, date, time, longitude, latitude, depth,
      maxintensity, magnitude) {
    String seismic = "";
    if (magnitude < 2) {
      seismic = "#sismo";
    } else if (magnitude >= 2 && magnitude < 3) {
      seismic = "#sismo1";
    } else if (magnitude >= 3 && magnitude < 4) {
      seismic = "#sismo2";
    } else if (magnitude >= 4 && magnitude < 5) {
      seismic = "#sismo3";
    } else {
      seismic = "#sismo4";
    }

    DateTime oneday = DateTime.parse(date).add(new Duration(days: 1));

    return '''<Placemark><name>Earthquake in $location</name><description>&lt;html xmlns:fo=http://www.w3.org/1999/XSL/Format&gt;&lt;body leftmargin=0 topmargin=0 bottommargin=0 rightmargin=0&gt;&lt;font face=Arial&gt;&lt;table border=1 width=300 cellpadding=5 cellspacing=0&gt;&lt;tr bgcolor=#D4E4F3&gt;&lt;td&gt;EVIDENCE&lt;/td&gt;&lt;td&gt;es2021ulxbh&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;DATE&lt;/td&gt;&lt;td&gt; $date $time&lt;/td&gt;&lt;/tr&gt;&lt;tr bgcolor=#D4E4F3&gt;&lt;td&gt;LATITUDE&lt;/td&gt;&lt;td&gt;$latitude&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;LONGITUDE&lt;/td&gt;&lt;td&gt;$longitude&lt;/td&gt;&lt;/tr&gt;&lt;tr bgcolor=#D4E4F3&gt;&lt;td&gt;DEPTH&lt;/td&gt;&lt;td&gt;$depth&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;MAX INTENSITY&lt;/td&gt;&lt;td&gt;$maxintensity&lt;/td&gt;&lt;/tr&gt;&lt;tr bgcolor=#D4E4F3&gt;&lt;td&gt;MAGNITUDE&lt;/td&gt;&lt;td&gt;$magnitude&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;LOCATION&lt;/td&gt;&lt;td&gt;$location&lt;/td&gt;&lt;/tr&gt;&lt;tr bgcolor=#D4E4F3&gt;&lt;td&gt;INFO&lt;/td&gt;&lt;td&gt;&lt;a href=https://www.ign.es/ign/layoutIn/sismoDetalleTerremotos.do?evid=es2021ulxbh target='_blank'&gt;+info&lt;/a&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&lt;/font&gt;&lt;/body&gt;&lt;/html&gt;</description><TimeSpan><begin>$date</begin><end>${oneday.toString().split(' ')[0]}</end></TimeSpan><styleUrl>$seismic</styleUrl><Point><coordinates>$longitude,$latitude</coordinates></Point></Placemark>''';
  }
}
