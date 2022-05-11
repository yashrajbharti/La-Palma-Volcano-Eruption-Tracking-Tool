import 'package:flutter/material.dart';

import 'package:webscrapperapp/codingapp/scraper/Located_Events/Scrape_Info.dart';
import 'package:webscrapperapp/codingapp/Tabs/Track_Tab.dart';
import 'package:webscrapperapp/codingapp/Tabs/Map_Tab.dart';

class Layout extends StatefulWidget {
  Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            elevation: 0,
            actions: const <Widget>[],
            title: Container(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.82,
                child: Container(
                  color: const Color.fromARGB(255, 149, 149, 149),
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: const TabBar(
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          " Track ",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      Tab(
                        child: Text(
                          " Map ",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      Tab(
                        child: Text(
                          " Info ",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 5.0,
                    indicatorPadding: EdgeInsets.only(top: 5),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SendtoLG(),
            MyMap(),
            const Seismicdata(),
          ],
        ),
      ),
    );
  }
}
