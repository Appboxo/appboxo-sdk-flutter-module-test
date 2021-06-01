import 'package:flutter/material.dart';
import 'package:appboxo_sdk/appboxo_sdk.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appboxo Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Appboxo Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Appboxo.setConfig('[clientId]', // your Appboxo client_id
        multitaskMode: false,
        // (optinal) 'multitaskMode' works only on Android. By default 'true', each miniapp appears as a task in the Recents screen.
        theme: 'dark' // (optinal) miniapp theme "dark" | "light" (by default is system theme)
        );
  }

  void _runMiniapp() {
    Appboxo.openMiniapp(
      "[appId]", // your miniapp id
      "[auth_payload]", // auth payload
      data: {'key': 'value'}, // (optinal) data as Map that is sent to miniapp
      theme: 'dark', // (optinal) miniapp theme "dark" | "light" (by default is system theme)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.black87,
                primary: Colors.grey[300],
                minimumSize: Size(88, 36),
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              onPressed: _runMiniapp,
              child: Text('Run miniapp'),
            ),
          ],
        ),
      ),
    );
  }
}
