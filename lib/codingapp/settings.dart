import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:ssh/ssh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isLoggedIn = false;
  bool obscurePassword = true;
  bool loaded = false;
  TextEditingController ipAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _isSigningOut = false;
  bool connectionStatus = false;

  connect() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('master_ip', ipAddress.text);
    await preferences.setString('master_password', password.text);

    SSHClient client = SSHClient(
      host: ipAddress.text,
      port: 2222,
      username: "lg",
      passwordOrKey: password.text,
    );

    try {
      await client.connect();
      showAlertDialog('Connected!', '${ipAddress.text} Host is reachable');
      setState(() {
        connectionStatus = true;
      });
      // open logos
      await client.disconnect();
    } catch (e) {
      showAlertDialog('Oops!',
          '${ipAddress.text} Host is not reachable. Check if the information given is correct and if the host can be reached');
      setState(() {
        connectionStatus = false;
      });
    }
  }

  checkConnectionStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('master_ip', ipAddress.text);
    await preferences.setString('master_password', password.text);

    SSHClient client = SSHClient(
      host: ipAddress.text,
      port: 2222,
      username: "lg",
      passwordOrKey: password.text,
    );

    try {
      await client.connect();
      setState(() {
        connectionStatus = true;
      });
      await client.disconnect();
    } catch (e) {
      showAlertDialog('Oops!',
          '${ipAddress.text} Host is not reachable. Check if the information given is correct and if the host can be reached');
      setState(() {
        connectionStatus = false;
      });
    }
  }

  showAlertDialog(String title, String msg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$title'),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            content: Text('$msg'),
          );
        });
  }

  init() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    ipAddress.text = preferences.getString('master_ip') ?? '';
    password.text = preferences.getString('master_password') ?? '';

    await checkConnectionStatus();

    loaded = true;
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) init();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                  child: Text(
                    'Liquid Galaxy Connection',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Status: ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        connectionStatus ? 'CONNECTED' : 'DISCONNECTED',
                        style: TextStyle(fontSize: 17),
                      ),
                      connectionStatus
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 20,
                            )
                          : Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 20,
                            ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextFormField(
                    controller: ipAddress,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'eg. 192.168.0.115',
                      labelText: 'Master machine IP Address',
                    ),
                  ),
                ),
                TextFormField(
                  controller: password,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'eg. the-passw0rd-0f-my-LG',
                    labelText: 'Master machine Password',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      side: BorderSide(color: Colors.blue, width: 1),
                    ),
                    onPressed: () {
                      connect();
                    },
                    child: Text('CONNECT'),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                ListTile(
                  leading: Text(
                    '🇺🇸',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('English (US)'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.language,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
