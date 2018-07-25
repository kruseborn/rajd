import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'newMap.dart';

class SideMenuButton extends StatelessWidget {
  final String _name;
  final Icon _icon;
  final String _onPressedRoute;
  final FindRajdState findRajdState = new FindRajdState();

  SideMenuButton(this._name, this._icon, this._onPressedRoute);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.all(5.0),
        ),
        new FlatButton(
          onPressed: () {
            print(_onPressedRoute);
            //findRajdState.showMap();
            Navigator.of(context).popAndPushNamed(_onPressedRoute);
          },
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.symmetric(horizontal: 10.0),
              ),
              _icon,
              new Padding(
                padding: new EdgeInsets.all(12.0),
              ),
              new Text(_name, style: new TextStyle(fontFamily: "Raleway", color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w100))
            ],
          ),
        ),
      ],
    );
  }
}

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new SideMenuButton("PAYMENT", new Icon(FontAwesomeIcons.coins), '/payment'),
          new SideMenuButton("RIDE HISTORY", new Icon(Icons.history), '/history'),
          new SideMenuButton("HOW TO RIDE", new Icon(FontAwesomeIcons.graduationCap), '/howToRide'),
          new SideMenuButton("SAFETY", new Icon(FontAwesomeIcons.medkit), '/safety'),
          new SideMenuButton("HELP", new Icon(FontAwesomeIcons.ambulance), '/help'),
          new SideMenuButton("SETTINGS", new Icon(FontAwesomeIcons.wrench), '/settings'),
          new SideMenuButton("FIND A RIDE", new Icon(Icons.favorite), '/map'),
        ],
      ),
    );
  }
}
