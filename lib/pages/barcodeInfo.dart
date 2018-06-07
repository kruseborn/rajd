import 'package:flutter/material.dart';
import 'sideMenu.dart';

class BarcodeInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: new AppBar(
       title: new Text("SCAN BIKE"),
      centerTitle: true,),
     drawer: new SideMenu(),
     body: new Container(
       padding: new EdgeInsets.all(32.0),
       child: new Center(
         child: new Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             new Image.asset("images/scanner.png", fit: BoxFit.scaleDown),
             new Text("The QR code is located on the handlebar, hold the phone over the QR code to start using the ride", style: Theme.of(context).textTheme.body2),
             RaisedButton(
               child: new Text("Start scanning"),
               onPressed: (){print("hello");}
             )
           ],
         )
       ),
      ) 
    );
  }
}