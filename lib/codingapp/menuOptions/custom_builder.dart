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
  Future dateTimeRangePicker() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      initialEntryMode:
          DatePickerEntryMode.calendarOnly, // removes the dialog entry mode
      firstDate: DateTime(2021, 09, 11),
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
    start: DateTime(2021, 09, 11),
    end: DateTime(2021, 12, 15),
  );
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
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
                      width: 100,
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
            ],
          ),
        ),
      ),
    );
  }
}
