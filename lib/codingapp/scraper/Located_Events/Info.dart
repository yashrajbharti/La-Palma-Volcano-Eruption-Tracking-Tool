import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

import 'package:webscrapperapp/codingapp/scraper/Located_Events/kmlcreate.dart';

class Seismicdata extends StatefulWidget {
  const Seismicdata();

  @override
  _SeismicdataState createState() => _SeismicdataState();
}

class _SeismicdataState extends State<Seismicdata> {
  // initialize WebScraper by passing base url of website
  final webScraper = WebScraper('https://www.ign.es');

  // Response of getElement is always List<Map<String, dynamic>>
  List<Map<String, dynamic>>? volcanicData;
  late List<Map<String, dynamic>> magnitude;
  late List<Map<String, dynamic>> latitude;
  late List<Map<String, dynamic>> longitude;

  void fetchSeismicdata() async {
    // Loads web page and downloads into local state of library
    if (await webScraper.loadWebPage(
        '/web/ign/portal/ultimos-terremotos/-/ultimos-terremotos')) {
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        volcanicData = webScraper.getElement('tr > td:nth-child(21)', []);
        magnitude = webScraper.getElement('tr > td:nth-child(15)', []);
        latitude = webScraper.getElement('tr > td:nth-child(9)', []);
        longitude = webScraper.getElement('tr > td:nth-child(11)', []);
      });
      kmlcreate(volcanicData!, magnitude, latitude, longitude);
    }
  }

  @override
  void initState() {
    super.initState();
    // Requesting to fetch before UI drawing starts
    fetchSeismicdata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: volcanicData == null
          ? const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 149, 149, 149),
              ), // Loads Circular Loading Animation
            )
          : ListView.builder(
              itemCount: volcanicData!.length,
              itemBuilder: (BuildContext context, int index) {
                // Attributes are in the form of List<Map<String, dynamic>>.
                String region = volcanicData![index]["title"];
                return Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Card(
                      child: Container(
                        color: Color.fromARGB(255, 220, 220, 220),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                    "Magnitude recorded: " +
                                        magnitude[index]["title"] +
                                        "\n" +
                                        "At location: " +
                                        region +
                                        "\n" "Coordinates: " +
                                        latitude[index]["title"] +
                                        "," +
                                        longitude[index]["title"],
                                    style: TextStyle(fontSize: 24)),
                                margin: const EdgeInsets.only(bottom: 10.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
