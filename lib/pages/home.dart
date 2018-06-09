import 'package:flutter/material.dart';
import 'sideMenu.dart';
import 'fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("RAJD", style: fonts.appBarTitle),
      ),
      drawer: new SideMenu(),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "RAJD",
              style: Theme.of(context).textTheme.display4,
            ),
          ],
        ),
      ),
    );
  }
}
