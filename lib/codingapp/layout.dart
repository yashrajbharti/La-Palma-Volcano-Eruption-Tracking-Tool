import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:webscrapperapp/codingapp/theme-storage.dart';
import 'package:webscrapperapp/codingapp/Tabs/Info.dart';
import 'package:webscrapperapp/codingapp/Tabs/Track_Tab.dart';
import 'package:webscrapperapp/codingapp/Tabs/Map_Tab.dart';
import 'package:showcaseview/showcaseview.dart';

class Layout extends StatefulWidget {
  Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

final GlobalKey _trackKey = GlobalKey();
final GlobalKey _mapKey = GlobalKey();
final GlobalKey _infoKey = GlobalKey();

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: AppBar(
              elevation: 0,
              actions: const <Widget>[],
              title: Container(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.82,
                  child: Consumer<ThemeModel>(
                    builder: (context, ThemeModel themeNotifier, child) =>
                        Container(
                      color: themeNotifier.isDark
                          ? Color.fromARGB(255, 30, 30, 30)
                          : Color.fromARGB(255, 149, 149, 149),
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: TabBar(
                        tabs: <Widget>[
                          Tab(
                              // child: Showcase(
                              //     key: _trackKey,
                              //     showcaseBackgroundColor:
                              //         Color.fromARGB(255, 125, 164, 243),
                              //     overlayPadding: EdgeInsets.all(8),
                              //     contentPadding: EdgeInsets.all(20),
                              //     description: "_counterTextDescription",
                              child: Text(
                            translate('tabs.track'),
                            style: TextStyle(fontSize: 40),
                          )),
                          // ),
                          Tab(
                              // child: Showcase(
                              //     key: _mapKey,
                              //     showcaseBackgroundColor:
                              //         Color.fromARGB(255, 125, 164, 243),
                              //     overlayPadding: EdgeInsets.all(8),
                              //     contentPadding: EdgeInsets.all(20),
                              //     description: "_counterTextDescription",
                              child: Text(
                            translate('tabs.map'),
                            style: TextStyle(fontSize: 40),
                          )),
                          // ),
                          Tab(
                              // child: Showcase(
                              //     key: _infoKey,
                              //     showcaseBackgroundColor:
                              //         Color.fromARGB(255, 125, 164, 243),
                              //     overlayPadding: EdgeInsets.all(8),
                              //     contentPadding: EdgeInsets.all(20),
                              //     description:
                              //         "_counte rText Descri ption bjjdbwjbd jwbdjwb wdwk",
                              child: Text(
                            translate('tabs.info'),
                            style: TextStyle(fontSize: 40),
                          )),
                          //  ),
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
            )),
        body: TabBarView(
          children: [
            SendtoLG(),
            MyMap(),
            VerticalCardPagerDemo(),
          ],
        ),
      ),
    );
  }

  void startTutorialtab() {
    ShowCaseWidget.of(context).startShowCase([_trackKey, _mapKey, _infoKey]);
  }
}
