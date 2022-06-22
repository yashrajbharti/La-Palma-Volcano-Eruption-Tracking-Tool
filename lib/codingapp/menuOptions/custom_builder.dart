import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';
import 'package:webscrapperapp/codingapp/drawer.dart';

class CustomBuilder extends StatefulWidget {
  CustomBuilder({Key? key}) : super(key: key);

  @override
  _CustomBuilderState createState() => _CustomBuilderState();
}

class _CustomBuilderState extends State<CustomBuilder> {
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
    });
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
      backgroundColor: Color.fromARGB(255, 204, 204, 204),
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
                height: 50,
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
                            checkColor: Color.fromARGB(255, 115, 184, 117),
                            fillColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 149, 149, 149)),
                          ),
                        ),
                        Text(
                          translate("custombuilder.tremor"),
                          style: TextStyle(fontSize: 20.0),
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
                            checkColor: Color.fromARGB(255, 115, 184, 117),
                            fillColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 149, 149, 149)),
                          ),
                        ),
                        Text(
                          translate("info.aff.lava"),
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon5.png'),
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
                            checkColor: Color.fromARGB(255, 115, 184, 117),
                            fillColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 149, 149, 149)),
                          ),
                        ),
                        Text(
                          translate("info.aff.vents"),
                          style: TextStyle(fontSize: 20.0),
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
                            checkColor: Color.fromARGB(255, 115, 184, 117),
                            fillColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 149, 149, 149)),
                          ),
                        ),
                        Text(
                          translate("info.aff.hydro"),
                          style: TextStyle(fontSize: 20.0),
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
                            checkColor: Color.fromARGB(255, 115, 184, 117),
                            fillColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 149, 149, 149)),
                          ),
                        ),
                        Text(
                          translate("custombuilder.buildings"),
                          style: TextStyle(fontSize: 20.0),
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
                            checkColor: Color.fromARGB(255, 115, 184, 117),
                            fillColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 149, 149, 149)),
                          ),
                        ),
                        Text(
                          translate("custombuilder.roads"),
                          style: TextStyle(fontSize: 20.0),
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
                            checkColor: Color.fromARGB(255, 115, 184, 117),
                            fillColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 149, 149, 149)),
                          ),
                        ),
                        Text(
                          translate("info.situation.maritime"),
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon6.png'),
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
                            checkColor: Color.fromARGB(255, 115, 184, 117),
                            fillColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 149, 149, 149)),
                          ),
                        ),
                        Text(
                          translate("custombuilder.closed"),
                          style: TextStyle(fontSize: 20.0),
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
                            checkColor: Color.fromARGB(255, 115, 184, 117),
                            fillColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 149, 149, 149)),
                          ),
                        ),
                        Text(
                          translate("info.situation.municipality"),
                          style: TextStyle(fontSize: 20.0),
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
                            checkColor: Color.fromARGB(255, 115, 184, 117),
                            fillColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 149, 149, 149)),
                          ),
                        ),
                        Text(
                          translate("info.situation.main"),
                          style: TextStyle(fontSize: 20.0),
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
                            checkColor: Color.fromARGB(255, 115, 184, 117),
                            fillColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 149, 149, 149)),
                          ),
                        ),
                        Text(
                          translate("custombuilder.natural"),
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/Polygon8.png'),
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
                            checkColor: Color.fromARGB(255, 115, 184, 117),
                            fillColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 149, 149, 149)),
                          ),
                        ),
                        Text(
                          translate("custombuilder.physiography"),
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset('assets/icons/physiography.png'),
                            iconSize: 20,
                            onPressed: () => {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
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
                            style: TextStyle(fontSize: 25)),
                        Icon(
                          Icons.location_on_sharp,
                          color: Color.fromARGB(255, 228, 6, 9),
                          size: 30.0,
                        ),
                      ],
                    ),
                    onPressed: () {
                      // send to LG
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTremorsActive(bool? newValue) => setState(() {
        tremor = newValue!;

        if (tremor) {
        } else {}
      });
  void _onlavaflowActive(bool? newValue) => setState(() {
        lavaflow = newValue!;

        if (lavaflow) {
        } else {}
      });

  void _onbuildingsActive(bool? newValue) => setState(() {
        buildings = newValue!;

        if (buildings) {
        } else {}
      });
  void _onroadsActive(bool? newValue) => setState(() {
        roads = newValue!;

        if (roads) {
        } else {}
      });
  void _onventsActive(bool? newValue) => setState(() {
        vents = newValue!;

        if (vents) {
        } else {}
      });
  void _onhydrographyActive(bool? newValue) => setState(() {
        hydrography = newValue!;

        if (hydrography) {
        } else {}
      });

  void _onmaritimeActive(bool? newValue) => setState(() {
        maritime = newValue!;

        if (maritime) {
        } else {}
      });
  void _onclosedroadsActive(bool? newValue) => setState(() {
        closedroads = newValue!;

        if (closedroads) {
        } else {}
      });
  void _onmunicipalitiesActive(bool? newValue) => setState(() {
        municipalities = newValue!;

        if (municipalities) {
        } else {}
      });

  void _onmaineruptiveActive(bool? newValue) => setState(() {
        maineruptive = newValue!;

        if (maineruptive) {
        } else {}
      });
  void _onnaturallandActive(bool? newValue) => setState(() {
        naturalland = newValue!;

        if (naturalland) {
        } else {}
      });
  void _onphysiographyActive(bool? newValue) => setState(() {
        physiography = newValue!;

        if (physiography) {
        } else {}
      });
}
