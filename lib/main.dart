import 'package:flutter/material.dart';
import 'pages/homePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          brightness: Brightness.dark,
          //primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],
        ),
      home: new MyHomePage('Flutter Demo Home Page'),
    );
  }
}

