import 'package:flutter/material.dart';
import 'sideMenu.dart';
import "fonts.dart"; 

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => new _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('PAYMENT', style: fonts.appBarTitle),
        centerTitle: true,
      ),
      drawer: new SideMenu(),
      body: new SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Image.asset("images/credit.png", width: 150.0,),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new TextField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintText: "Card number",
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new TextField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintText: "Expiration date",
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new TextField(
                keyboardType: TextInputType.number,
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
                    child: new Text("Save", style: new TextStyle(fontSize: 17.0),),
                    onPressed: (){ print("hellor world");},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}