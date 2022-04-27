import 'package:flutter/material.dart';

class Drawers extends StatefulWidget {
  Drawers({Key? key}) : super(key: key);

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black45,
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "La Palmas",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/one.jpeg')),
              ),
            ),
            ListTile(
              title: Text(
                'First',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.anchor,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Second',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Third',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.garage,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
