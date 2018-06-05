import 'package:flutter/material.dart';
import 'sideMenu.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: new AppBar(title: new Text("History")),
     drawer: new SideMenu(),
     body: new Container(
       padding: new EdgeInsets.all(32.0),
       child: new Center(
         child: new Column(
           children: <Widget>[
             new Text("History"),
           ],
         )
       ),
      ) 
    );
  }
}