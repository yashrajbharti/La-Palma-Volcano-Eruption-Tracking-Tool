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
  TextEditingController username = TextEditingController();
  TextEditingController ipAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController portNumber = TextEditingController();

  bool connectionStatus = false;

  connect() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('master_ip', ipAddress.text);
    await preferences.setString('master_username', username.text);
    await preferences.setString('master_password', password.text);
    await preferences.setString('master_portNumber', portNumber.text);

    SSHClient client = SSHClient(
      host: ipAddress.text,
      port: int.parse(portNumber.text),
      username: username.text,
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
    await preferences.setString('master_portNumber', portNumber.text);

    SSHClient client = SSHClient(
      host: ipAddress.text,
      port: int.tryParse(portNumber.text),
      username: username.text,
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
                  icon: const Icon(
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
    username.text = preferences.getString('master_username') ?? '';
    password.text = preferences.getString('master_password') ?? '';
    portNumber.text = preferences.getString('master_portNumber') ?? '';

    await checkConnectionStatus();

    loaded = true;
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) init();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 10),
                  child: Text(
                    'Liquid Galaxy Connection',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 10),
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
                  padding: EdgeInsets.only(bottom: 0.0),
                  child: TextFormField(
                    controller: username,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'eg. lg',
                      labelText: 'Master machine Username',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
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
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: TextFormField(
                    controller: portNumber,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'eg. 22',
                      labelText: 'Master machine Port Number',
                    ),
                  ),
                ),
                TextFormField(
                  controller: password,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'eg. the-password-of-my-LG',
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
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    child: Text('CONNECT To LG'),
                    onPressed: () {
                      connect();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
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
              ],
            ),
          ),
        ));
  }
}
