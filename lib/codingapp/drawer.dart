import 'package:flutter/material.dart';

import 'package:webscrapperapp/codingapp/mainpage.dart';
import 'package:webscrapperapp/codingapp/menuOptions/help.dart';
import 'package:webscrapperapp/codingapp/menuOptions/lg_tasks.dart';
import 'package:webscrapperapp/codingapp/menuOptions/settings.dart';
import 'package:webscrapperapp/codingapp/menuOptions/about.dart';

class Drawers extends StatefulWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1.0,
      child: Drawer(
        child: Container(
          color: Color.fromARGB(255, 204, 204, 204),
          child: ListView(
            padding: const EdgeInsets.only(left: 100),
            children: [
              DrawerHeader(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: const Text(
                        "Liquid Galaxy Menu",
                        style: TextStyle(color: Colors.black, fontSize: 46),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 36, 65),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              shadowColor: Colors.transparent,
                              primary: Color.fromARGB(255, 204, 204, 204),
                              padding: EdgeInsets.all(15)),
                          child: const Icon(
                            Icons.clear_rounded,
                            color: Color.fromARGB(255, 84, 84, 84),
                            size: 60,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => First(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text(
                  'Help',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => HelpScreen(),
                  ),
                ),
              ),
              SizedBox(height: 24),
              ListTile(
                title: const Text(
                  'About',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => AboutScreen(),
                  ),
                ),
              ),
              SizedBox(height: 24),
              ListTile(
                title: const Text(
                  'LG Tasks',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => LGtasks(),
                  ),
                ),
              ),
              SizedBox(height: 24),
              ListTile(
                title: const Text(
                  'Connection Manager',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Settings(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
