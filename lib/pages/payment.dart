import 'package:flutter/material.dart';
import 'sideMenu.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => new _PaymentState();
}

class _PaymentState extends State<Payment> {
  String _platformVersion = 'Unknown';

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Plugin example app'),
      ),
      drawer: new SideMenu(),
      body: new Container(
        padding: const EdgeInsets.all(32.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                hintText: "Card number",
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(10.0),
            ),
            new TextField(
              decoration: new InputDecoration(
                hintText: "Expiration date",
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(10.0),
            ),
            new TextField(
              decoration: new InputDecoration(
                hintText: "CVC",
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(10.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new RaisedButton(
                  child: new Text("Set"),
                  onPressed: (){ print("hellor world");},
                )
              ],
            )
          ],
        ) 
      ),
    );
  }
}