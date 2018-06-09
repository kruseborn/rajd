import 'package:flutter/material.dart';
import 'sideMenu.dart';
import 'fonts.dart';

class SafetyTile extends StatelessWidget {

  SafetyTile(this._title, this._body);
  final String _title;
  final String _body;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0), 
      padding: new EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.circular(5.0),
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(_title, style: new TextStyle(fontFamily: "Raleway", color: Colors.red, fontSize: 30.0)),
          new Padding(
            padding: new EdgeInsets.all(5.0),
          ),
          new Text(_body, style: new TextStyle(color: Colors.grey[700], fontSize: 15.0)),
        ],
      ),
    );
  }
}

class Safety extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: new AppBar(title: new Text("SAFETY", style: fonts.appBarTitle), centerTitle: true),
     drawer: new SideMenu(),
     body: new Container(
       decoration: new BoxDecoration(
       /*  gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter, // 10% of the width, so there are ten blinds.
            colors: [const Color(0xFF141e30), const Color(0xFF243b55)], // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),*/
       ),
       child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.all(10.0),
          ),
          new Text("Safety First", style: new TextStyle(fontFamily: "Raleway", fontSize: 40.0), textAlign: TextAlign.center,),
          new Padding(
            padding: new EdgeInsets.all(10.0),
          ),
          SafetyTile("Helmet", "Wear a helmet when you ride, it´s required by law."),
          SafetyTile("20 km/h", "Our vehicle are throttled to 20 km/h per hour for your safety"),
          SafetyTile("18+ Years old", "You must enter your date of birth when signing up to Rajd"),
          SafetyTile("Driver License", "A Driver License is required to ride"),
          SafetyTile("One Rider", "Rajd is fun with friends, but only one rider per Rajd please"),
          SafetyTile("Traffic Rules", "Follow all local traffic rules"),
        ],
        )
      )
    );
  }
}