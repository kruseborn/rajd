import 'package:flutter/material.dart';
import 'sideMenu.dart';

class BarcodeInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("SCAN BIKE"), 
        centerTitle: true,
      ),
      drawer: new SideMenu(),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Image.asset(
                "images/scooter2.png", 
                fit: BoxFit.scaleDown,
              ),
              new Text(
                "THE QR CODE IS LOCATED ON THE HANDLEBAR, HOLD THE PHONE OVER THE QR CODE TO START THE RIDE", 
                style: Theme.of(context).textTheme.body2),
              RaisedButton(
                child: new Text("Start scanning"),
                onPressed: (){ Navigator.of(context).popAndPushNamed("/barcode"); }
              )
           ],
         )
       ),
      ) 
    );
  }
}