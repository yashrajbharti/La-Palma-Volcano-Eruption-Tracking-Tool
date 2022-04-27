import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart'; // important imports
import 'package:web_socket_channel/io.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        channel:
            IOWebSocketChannel.connect("wss://echo.websocket.events"), // server
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final WebSocketChannel channel;
  const MyHomePage({required this.channel}); // channel
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController =
      TextEditingController(); // controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("web socket"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Form(
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Send any message"),
                    controller: editingController,
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                StreamBuilder(
                    stream: widget.channel.stream,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          snapshot.hasData ? '${snapshot.data}' : '',
                          style: TextStyle(fontSize: 50),
                        ),
                      );
                    })
              ]),
        ),
        floatingActionButton: Container(
            height: 100.0,
            width: 100.0,
            child: FittedBox(
                child: FloatingActionButton(
              child: const Icon(Icons.send),
              onPressed: _sendMyMessage,
            ))));
  }

  void _sendMyMessage() {
    if (editingController.text.isNotEmpty) {
      widget.channel.sink.add(editingController.text);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
