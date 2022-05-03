import 'package:flutter/material.dart';
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
            color: Colors.black45,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Liquid Galaxy Menu",
                        style: TextStyle(color: Colors.white),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Help',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    'About',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => AboutScreen(),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'LG Tasks',
                    style: TextStyle(color: Colors.white),
                  ),
                  // leading: const Icon(
                  //   Icons.garage,
                  //   color: Colors.white,
                  // ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    'Connection Manager',
                    style: TextStyle(color: Color.fromARGB(255, 223, 206, 206)),
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
        ));
  }
}
