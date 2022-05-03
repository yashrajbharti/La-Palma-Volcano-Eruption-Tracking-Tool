import 'package:flutter/material.dart';

import 'package:webscrapperapp/codingapp/Tabs/Info_Tab.dart';
import 'package:webscrapperapp/codingapp/Tabs/Track_Tab.dart';
import 'package:webscrapperapp/codingapp/Tabs/Map_Tab.dart';

import 'package:webscrapperapp/codingapp/menuOptions/settings.dart';

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
        appBar: AppBar(
          actions: const <Widget>[],
          title: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Track"),
              ),
              Tab(
                child: Text("Map"),
              ),
              Tab(
                child: Text("Info"),
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            SendtoLG(),
            MyMap(),
            Seismicdata(),
          ],
        ),
      ),
    );
  }
}
