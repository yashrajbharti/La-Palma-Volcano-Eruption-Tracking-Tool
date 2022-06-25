import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:ssh/ssh.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webscrapperapp/codingapp/drawer.dart';
import 'package:webscrapperapp/codingapp/kml/customkml.dart';
import 'package:webscrapperapp/codingapp/kml/lavabuilder.dart';
import 'package:webscrapperapp/codingapp/kml/roadsbuilder.dart';
import 'package:webscrapperapp/codingapp/kml/buildingsbuilder.dart';
import 'package:webscrapperapp/codingapp/kml/kml.dart';
import 'package:webscrapperapp/codingapp/kml/LookAt.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webscrapperapp/codingapp/kml/tremorbuilder.dart';
import 'package:webscrapperapp/codingapp/kml/kmlgenerator.dart';

class CustomBuilder extends StatefulWidget {
  CustomBuilder({Key? key}) : super(key: key);

  @override
  _CustomBuilderState createState() => _CustomBuilderState();
}

class _CustomBuilderState extends State<CustomBuilder> {
  List<String> kmltext = ['', '', '', '', '', '', '', '', '', '', '', '', ''];
  KML kml = KML("", "");
  late final themeData;
  bool tremor = false;
  bool lavaflow = false;
  bool buildings = false;
  bool roads = false;
  bool vents = false;
  bool hydrography = false;
  bool closedroads = false;
  bool municipalities = false;
  bool maritime = false;
  bool maineruptive = false;
  bool naturalland = false;
  bool physiography = false;
  bool areaofinterest = false;
  bool isOpen = false;
  late var start;
  late var end;

  Future dateTimeRangePicker() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      initialEntryMode:
          DatePickerEntryMode.calendarOnly, // removes the dialog entry mode
      firstDate: DateTime(2021, 09, 19),
      lastDate: DateTime(2021, 12, 15),
      builder: (context, Widget? child) => Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 400.0,
            ),
            child: Theme(
              data: ThemeData.light().copyWith(
                //Header background color
                primaryColor: Color.fromARGB(255, 125, 164, 243),
                //Background color
                scaffoldBackgroundColor: Color.fromARGB(255, 204, 204, 204),
                //Divider color
                dividerColor: Colors.grey,
                //Non selected days of the month color
                textTheme: TextTheme(
                  bodyText2: TextStyle(color: Colors.black),
                  button: TextStyle(fontSize: 18),
                ),
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  //Selected dates background color
                  primary: Color.fromARGB(255, 125, 164, 243),
                  //Month title and week days color
                  onSurface: Colors.black,
                  //Header elements and selected dates text color
                  //onPrimary: Colors.white,
                ),
                iconTheme: IconThemeData(
                  size: 30.0,
                ),
              ),
              child: child!,
            ),
          ),
        ],
      ),
    );
    setState(() {
      dateRange = newDateRange ?? dateRange;
      resetchecks();
    });
  }

  showAlertDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 4, sigmaY: 3),
          child: AlertDialog(
            backgroundColor: Color.fromARGB(255, 33, 33, 33),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 204, 204, 204),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.clear_rounded,
                    color: Color.fromARGB(255, 125, 164, 243),
                    size: 32,
                  ),
                  padding: EdgeInsets.only(bottom: 10),
                ),
              ],
            ),
            content: Text(
              '$msg',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showToast(String x) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "$x",
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
              fontFamily: "OldStandard"),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: ui.Color.fromARGB(250, 43, 43, 43),
        width: 500.0,
        padding: const EdgeInsets.fromLTRB(
          35,
          20,
          15,
          20,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        action: SnackBarAction(
          textColor: Color.fromARGB(255, 125, 164, 243),
          label: translate('Track.close'),
          onPressed: () {},
        ),
      ),
    );
  }

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2021, 09, 19),
    end: DateTime(2021, 12, 15),
  );
  @override
  Widget build(BuildContext context) {
    start = dateRange.start;
    end = dateRange.end;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 50.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Drawers(),
                ),
              );
            },
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(204, 204, 204, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20, top: 50),
                child: Text(
                  translate("drawer.custom"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      translate("custombuilder.range"),
                      style: TextStyle(
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      width: 69,
                    ),
                    Container(
                      child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            shadowColor: Colors.transparent,
                            primary: Color.fromARGB(255, 125, 164, 243),
                            padding: EdgeInsets.all(15),
                            shape: StadiumBorder(),
                          ),
                          child: Text(
                            '${start.year}/${start.month}/${start.day}',
                          ),
                          onPressed: dateTimeRangePicker,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            shadowColor: Colors.transparent,
                            primary: Color.fromARGB(255, 232, 108, 99),
                            padding: EdgeInsets.all(15),
                            shape: StadiumBorder(),
                          ),
                          child: Text(
                            '${end.year}/${end.month}/${end.day}',
                          ),
                          onPressed: dateTimeRangePicker,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding:
                    EdgeInsets.only(bottom: 55, left: 50, right: 50, top: 45),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          translate("custombuilder.after"),
                          style: TextStyle(fontSize: 22, color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: tremor,
                                  onChanged: _onTremorsActive,
                                  checkColor:
                                      Color.fromARGB(255, 115, 184, 117),
                                  fillColor: MaterialStateProperty.all(
                                      Color.fromARGB(250, 43, 43, 43)),
                                ),
                              ),
                              Text(
                                translate("custombuilder.tremor"),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              const Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 255, 248, 82),
                                size: 20,
                              ),
                              const Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 247, 184, 68),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: lavaflow,
                                  onChanged: _onlavaflowActive,
                                  checkColor:
                                      Color.fromARGB(255, 115, 184, 117),
                                  fillColor: MaterialStateProperty.all(
                                      Color.fromARGB(250, 43, 43, 43)),
                                ),
                              ),
                              Text(
                                translate("info.aff.lava"),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Builder(
                                builder: (context) => IconButton(
                                  icon:
                                      Image.asset('assets/icons/lava_flow.png'),
                                  iconSize: 20,
                                  onPressed: () => {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: vents,
                                  onChanged: _onventsActive,
                                  checkColor:
                                      Color.fromARGB(255, 115, 184, 117),
                                  fillColor: MaterialStateProperty.all(
                                      Color.fromARGB(250, 43, 43, 43)),
                                ),
                              ),
                              Text(
                                translate("info.aff.vents"),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              Builder(
                                builder: (context) => IconButton(
                                  icon: Image.asset('assets/icons/vent.png'),
                                  iconSize: 36,
                                  onPressed: () => {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: hydrography,
                                  onChanged: _onhydrographyActive,
                                  checkColor:
                                      Color.fromARGB(255, 115, 184, 117),
                                  fillColor: MaterialStateProperty.all(
                                      Color.fromARGB(250, 43, 43, 43)),
                                ),
                              ),
                              Text(
                                translate("info.aff.hydro"),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "▬▬",
                                style: TextStyle(
                                    fontSize: 18.5,
                                    color: Color.fromARGB(255, 3, 95, 171),
                                    fontFamily: "OldStandard"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: buildings,
                                  onChanged: _onbuildingsActive,
                                  checkColor:
                                      Color.fromARGB(255, 115, 184, 117),
                                  fillColor: MaterialStateProperty.all(
                                      Color.fromARGB(250, 43, 43, 43)),
                                ),
                              ),
                              Text(
                                translate("custombuilder.buildings"),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              const Icon(
                                Icons.square_rounded,
                                color: Color.fromARGB(255, 237, 56, 51),
                                size: 30,
                              ),
                              const Icon(
                                Icons.square_rounded,
                                color: Color.fromARGB(255, 253, 230, 125),
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: roads,
                                  onChanged: _onroadsActive,
                                  checkColor:
                                      Color.fromARGB(255, 115, 184, 117),
                                  fillColor: MaterialStateProperty.all(
                                      Color.fromARGB(250, 43, 43, 43)),
                                ),
                              ),
                              Text(
                                translate("custombuilder.roads"),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "▬▬  ",
                                style: TextStyle(
                                    fontSize: 18.5,
                                    color: Colors.red,
                                    fontFamily: "OldStandard"),
                              ),
                              Text(
                                "▬▬  ",
                                style: TextStyle(
                                    fontSize: 18.5,
                                    color: Color.fromARGB(255, 249, 233, 82),
                                    fontFamily: "OldStandard"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: maritime,
                                  onChanged: _onmaritimeActive,
                                  checkColor:
                                      Color.fromARGB(255, 115, 184, 117),
                                  fillColor: MaterialStateProperty.all(
                                      Color.fromARGB(250, 43, 43, 43)),
                                ),
                              ),
                              Text(
                                translate("custombuilder.maritime"),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Builder(
                                builder: (context) => IconButton(
                                  icon:
                                      Image.asset('assets/icons/Polygon6.png'),
                                  iconSize: 20,
                                  onPressed: () => {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: closedroads,
                                  onChanged: _onclosedroadsActive,
                                  checkColor:
                                      Color.fromARGB(255, 115, 184, 117),
                                  fillColor: MaterialStateProperty.all(
                                      Color.fromARGB(250, 43, 43, 43)),
                                ),
                              ),
                              Text(
                                translate("custombuilder.closed"),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Builder(
                                builder: (context) => IconButton(
                                  icon: Image.asset('assets/icons/close.png'),
                                  iconSize: 20,
                                  onPressed: () => {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: municipalities,
                                  onChanged: _onmunicipalitiesActive,
                                  checkColor:
                                      Color.fromARGB(255, 115, 184, 117),
                                  fillColor: MaterialStateProperty.all(
                                      Color.fromARGB(250, 43, 43, 43)),
                                ),
                              ),
                              Text(
                                translate("info.situation.municipality"),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                translate("info.situation.Text"),
                                style: TextStyle(
                                    fontSize: 23.0,
                                    color: Color.fromARGB(255, 132, 95, 55),
                                    fontFamily: "OldStandard"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: maineruptive,
                                  onChanged: _onmaineruptiveActive,
                                  checkColor:
                                      Color.fromARGB(255, 115, 184, 117),
                                  fillColor: MaterialStateProperty.all(
                                      Color.fromARGB(250, 43, 43, 43)),
                                ),
                              ),
                              Text(
                                translate("custombuilder.main"),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Builder(
                                  builder: (context) => IconButton(
                                    icon: Image.asset(
                                        'assets/icons/main_eruptive_event.png'),
                                    iconSize: 20,
                                    onPressed: () => {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: naturalland,
                                  onChanged: _onnaturallandActive,
                                  checkColor:
                                      Color.fromARGB(255, 115, 184, 117),
                                  fillColor: MaterialStateProperty.all(
                                      Color.fromARGB(250, 43, 43, 43)),
                                ),
                              ),
                              Text(
                                translate("custombuilder.natural"),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Builder(
                                builder: (context) => IconButton(
                                  icon: Image.asset(
                                      'assets/icons/natural_land.png'),
                                  iconSize: 20,
                                  onPressed: () => {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: physiography,
                                  onChanged: _onphysiographyActive,
                                  checkColor:
                                      Color.fromARGB(255, 115, 184, 117),
                                  fillColor: MaterialStateProperty.all(
                                      Color.fromARGB(250, 43, 43, 43)),
                                ),
                              ),
                              Text(
                                translate("custombuilder.physiography"),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Builder(
                                builder: (context) => IconButton(
                                  icon: Image.asset(
                                      'assets/icons/physiography.png'),
                                  iconSize: 20,
                                  onPressed: () => {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: areaofinterest,
                                  onChanged: _onareaofinterestActive,
                                  checkColor:
                                      Color.fromARGB(255, 115, 184, 117),
                                  fillColor: MaterialStateProperty.all(
                                      Color.fromARGB(250, 43, 43, 43)),
                                ),
                              ),
                              Text(
                                translate("custombuilder.area"),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              const Icon(
                                Icons.rectangle_outlined,
                                color: Color.fromARGB(255, 72, 188, 26),
                                size: 46,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 125, 164, 243),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.0),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          primary: Colors.white,
                          padding: EdgeInsets.all(15),
                          shape: StadiumBorder(),
                        ),
                        child: Wrap(
                          children: <Widget>[
                            SizedBox(
                              width: 7,
                            ),
                            Text(translate('Track.visual'),
                                style: TextStyle(fontSize: 26)),
                            Icon(
                              Icons.location_on_sharp,
                              color: Color.fromARGB(255, 228, 6, 9),
                              size: 30.0,
                            ),
                          ],
                        ),
                        onPressed: () {
                          // send to LG
                          setState(() {
                            String customDataFinal = "";
                            for (int i = 0; i <= 12; i++)
                              customDataFinal += kmltext[i];
                            kml = KML("custombuilt", customDataFinal);
                          });
                          LGConnection().cleanVisualization();
                          LGConnection()
                              .sendToLG(kml.mount(), "custombuilt")
                              .then((value) {
                            _showToast(translate('Track.Visualize'));
                            //LGConnection().buildOrbit(kml.mount());
                            setState(() {
                              isOpen = true;
                            });
                          }).catchError((onError) {
                            print('oh no $onError');
                            if (onError == 'nogeodata') {
                              showAlertDialog(translate('Track.alert'),
                                  translate('Track.alert2'));
                            }
                            showAlertDialog(translate('Track.alert3'),
                                translate('Track.alert4'));
                          });
                        }),
                  ),
                  Padding(
                    padding: new EdgeInsets.only(
                      left: 20.0,
                      right: 10.0,
                    ),
                    child: Container(
                      color: Color.fromARGB(255, 204, 204, 204),
                      child: Builder(
                        builder: (context) => IconButton(
                          icon: Image.asset('assets/icons/download.png'),
                          iconSize: 55,
                          onPressed: () async {
                            setState(() {
                              String customDataFinal = "";
                              for (int i = 0; i <= 12; i++)
                                customDataFinal += kmltext[i];
                              kml = KML("custombuilt", customDataFinal);
                            });
                            var status = await Permission.storage.status;

                            if (status.isGranted && "custombuilt" != "") {
                              try {
                                await KMLGenerator.generateKML(
                                    kml.mount(), "custombuilt");
                                showAlertDialog(translate("Tasks.alert"),
                                    translate("Tasks.alert2"));
                              } catch (e) {
                                print('error $e');
                                showAlertDialog(translate("Tasks.alert3"),
                                    translate("Tasks.alert4"));
                              }
                            } else {
                              var isGranted =
                                  await Permission.storage.request().isGranted;
                              if (isGranted && "custombuilt" != "") {
                                // download kml
                                try {
                                  await KMLGenerator.generateKML(
                                      kml.mount(), "custombuilt");
                                  showAlertDialog(translate("Tasks.alert"),
                                      translate("Tasks.alert2"));
                                } catch (e) {
                                  print('error $e');
                                  showAlertDialog(translate("Tasks.alert3"),
                                      translate("Tasks.alert4"));
                                }
                              } else {
                                showAlertDialog(translate("Tasks.alert3"),
                                    translate("Tasks.alert4"));
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onnaturallandActive(bool? newValue) => setState(() {
        naturalland = newValue!;
        if (naturalland == true) {
          kmltext[0] = NaturalLand().generateTag(
              start.toString().split(" ")[0], end.toString().split(" ")[0]);
          _showToast(translate('Track.ready'));
        } else {
          kmltext[0] = "";
        }
      });
  void _onareaofinterestActive(bool? newValue) => setState(() {
        areaofinterest = newValue!;
        if (areaofinterest == true) {
          kmltext[1] = AreaOfInterest().generateTag(
              start.toString().split(" ")[0], end.toString().split(" ")[0]);
          _showToast(translate('Track.ready'));
        } else {
          kmltext[1] = "";
        }
      });
  void _onmaritimeActive(bool? newValue) => setState(() {
        maritime = newValue!;
        if (maritime == true) {
          kmltext[2] = Maritime().generateTag(
              start.toString().split(" ")[0], end.toString().split(" ")[0]);
          _showToast(translate('Track.ready'));
        } else {
          kmltext[2] = "";
        }
      });
  void _onroadsActive(bool? newValue) => setState(() {
        roads = newValue!;
        if (roads == true) {
          kmltext[3] = Roadsdestroyed().generateTag(
              start.toString().split(" ")[0], end.toString().split(" ")[0]);
          _showToast(translate('Track.ready'));
        } else {
          kmltext[3] = "";
        }
      });
  void _onventsActive(bool? newValue) => setState(() {
        vents = newValue!;
        if (vents == true) {
          kmltext[4] = Vents().generateTag(
              start.toString().split(" ")[0], end.toString().split(" ")[0]);
          _showToast(translate('Track.ready'));
        } else {
          kmltext[4] = "";
        }
      });
  void _onhydrographyActive(bool? newValue) => setState(() {
        hydrography = newValue!;
        if (hydrography == true) {
          kmltext[5] = Hydrography().generateTag(
              start.toString().split(" ")[0], end.toString().split(" ")[0]);
          _showToast(translate('Track.ready'));
        } else {
          kmltext[5] == "";
        }
      });
  void _onlavaflowActive(bool? newValue) => setState(() {
        lavaflow = newValue!;
        if (lavaflow == true) {
          kmltext[6] = Lavabuilder().generateTag(
              start.toString().split(" ")[0], end.toString().split(" ")[0]);
          _showToast(translate('Track.ready'));
        } else {
          kmltext[6] = "";
        }
      });

  void _onclosedroadsActive(bool? newValue) => setState(() {
        closedroads = newValue!;
        if (closedroads == true) {
          kmltext[7] = ClosedRoads().generateTag(
              start.toString().split(" ")[0], end.toString().split(" ")[0]);
          _showToast(translate('Track.ready'));
        } else {
          kmltext[7] = "";
        }
      });
  void _onmunicipalitiesActive(bool? newValue) => setState(() {
        municipalities = newValue!;
        if (municipalities == true) {
          kmltext[8] = Municipalities().generateTag(
              start.toString().split(" ")[0], end.toString().split(" ")[0]);
          _showToast(translate('Track.ready'));
        } else {
          kmltext[8] = "";
        }
      });

  void _onmaineruptiveActive(bool? newValue) => setState(() {
        maineruptive = newValue!;
        if (maineruptive == true) {
          kmltext[9] = MainEruptive().generateTag(
              start.toString().split(" ")[0], end.toString().split(" ")[0]);
          _showToast(translate('Track.ready'));
        } else {
          kmltext[9] = "";
        }
      });

  void _onTremorsActive(bool? newValue) => setState(() {
        tremor = newValue!;
        if (tremor == true) {
          kmltext[10] = TremorBuilder().generateTag(
              start.toString().split(" ")[0], end.toString().split(" ")[0]);
          _showToast(translate('Track.ready'));
        } else {
          kmltext[10] = "";
        }
      });
  void _onphysiographyActive(bool? newValue) => setState(() {
        physiography = newValue!;
        if (physiography == true) {
          kmltext[11] = Physiography().generateTag(
              start.toString().split(" ")[0], end.toString().split(" ")[0]);
          _showToast(translate('Track.ready'));
        } else {
          kmltext[11] = "";
        }
      });
  void _onbuildingsActive(bool? newValue) => setState(() {
        buildings = newValue!;
        if (buildings == true) {
          kmltext[12] = Buildingsdestroyed().generateTag(
              start.toString().split(" ")[0], end.toString().split(" ")[0]);
          _showToast(translate('Track.ready'));
        } else {
          kmltext[12] = "";
        }
      });
  void resetchecks() {
    tremor = false;
    lavaflow = false;
    buildings = false;
    roads = false;
    vents = false;
    hydrography = false;
    closedroads = false;
    municipalities = false;
    maritime = false;
    maineruptive = false;
    naturalland = false;
    physiography = false;
    areaofinterest = false;
    for (int i = 0; i <= 12; i++) kmltext[i] = "";
  }
}

class LGConnection {
  Future sendToLG(String kml, String projectname) async {
    if (kml.isNotEmpty) {
      return _createLocalFile(kml, projectname);
    }
    return Future.error('nogeodata');
  }

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

    return {
      "ip": ipAddress,
      "pass": password,
      "port": portNumber,
      "username": username,
    };
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  _createLocalFile(String kml, String projectname) async {
    String localPath = await _localPath;
    File localFile = File('$localPath/$projectname.kml');
    localFile.writeAsString(kml);
    File localFile2 = File('$localPath/kmls.txt');
    localFile2.writeAsString(kml);
    return _uploadToLG('$localPath/$projectname.kml', projectname);
  }

  _uploadToLG(String localPath, String projectname) async {
    dynamic credencials = await _getCredentials();

    SSHClient client = SSHClient(
      host: '${credencials['ip']}',
      port: int.parse('${credencials['port']}'),
      username: '${credencials['username']}',
      passwordOrKey: '${credencials['pass']}',
    );

    LookAt flyto = LookAt(
      -17.895486,
      28.610478,
      '25069.665945696469',
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
      await client.execute(
          'echo "http://lg1:81/$projectname.kml" > /var/www/html/kmls.txt');

      return await client.execute(
          'echo "flytoview=${flyto.generateLinearString()}" > /tmp/query.txt');
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
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
}
