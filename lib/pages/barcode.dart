import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'sideMenu.dart';
import 'fonts.dart';

class Barcode extends StatefulWidget {
  @override
  _BarcodeSate createState() => new _BarcodeSate();
}

class _BarcodeSate extends State<Barcode> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("SCAN BIKE", style: fonts.appBarTitle), 
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
                onPressed: (){ scan(); }
              ),
              new Text(
                barcode, 
                style: Theme.of(context).textTheme.body2),
           ],
         )
       ),
      ) 
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}