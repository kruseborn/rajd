import 'package:flutter/material.dart'; 

class SideMenuButton extends StatelessWidget {
  final String _name;
  final Icon _icon;
  final String _onPressedRoute;

  SideMenuButton(this._name, this._icon, this._onPressedRoute);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Padding(padding: new EdgeInsets.all(5.0),),
        new FlatButton(
          onPressed: () { print(_onPressedRoute); Navigator.of(context).popAndPushNamed(_onPressedRoute); },
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
              new Text(_name, style: new TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w100))
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
          new SideMenuButton("PAYMENT", new Icon(Icons.cake), '/payment'),
          new SideMenuButton("RIDE HISTORY", new Icon(Icons.bug_report), '/history'),
          new SideMenuButton("HOW TO RIDE", new Icon(Icons.border_outer), '/'),
          new SideMenuButton("SAFETY", new Icon(Icons.border_top), '/'),
          new SideMenuButton("HELP", new Icon(Icons.bluetooth_audio), '/help'),
          new SideMenuButton("SETTINGS", new Icon(Icons.remove), '/'),
          new SideMenuButton("FIND A RIDE", new Icon(Icons.favorite), '/map'),
        ],
      ),
    );
  }
}