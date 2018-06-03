import 'package:flutter/material.dart';

class SideMenuButton extends StatelessWidget {
  final String _name;
  final Icon _icon;

  SideMenuButton(this._name, this._icon);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Padding(padding: new EdgeInsets.all(5.0),),
        new FlatButton(
          onPressed: () => print("hej"),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.symmetric(horizontal: 30.0),
              ),
              _icon,
              new Padding(
                padding: new EdgeInsets.all(12.0),
              ),
              new Text(_name, style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage(this.title);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      drawer: new Drawer(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new SideMenuButton("Payment", new Icon(Icons.cake)),
            new SideMenuButton("Ride history", new Icon(Icons.bug_report)),
            new SideMenuButton("How to ride", new Icon(Icons.border_outer)),
            new SideMenuButton("Safetly", new Icon(Icons.border_top)),
            new SideMenuButton("Help", new Icon(Icons.bluetooth_audio)),
            new SideMenuButton("User setting", new Icon(Icons.remove)),
          ],
        ),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      ),
    );
  }
}
