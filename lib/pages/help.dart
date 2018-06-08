import 'package:flutter/material.dart';
import 'sideMenu.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  _launchURL() async {
    const url = 'mailto:kruseborn@gmail.com?subject=Rajd support&body=New%20plugin';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: new AppBar(title: new Text("Help")),
     drawer: new SideMenu(),
     body: new Container(
       padding: new EdgeInsets.all(32.0),
       child: new Center(
         child: new Column(
           children: <Widget>[
             new FlutterLogo(
               size: 100.0,
             ),
             new Padding(
               padding: new EdgeInsets.all(10.0),
             ),
             new Text("Feel free to leave us any message about anything that is on your mind. We will try to answer your questions as soon a possible.",
             style: Theme.of(context).textTheme.body2),
             new Padding(
               padding: new EdgeInsets.all(10.0),
             ),
             new Text("To get in contact with the Rajd team, please click the link below",
               style: Theme.of(context).textTheme.body2),
             new Padding(
              padding: new EdgeInsets.all(10.0),
             ),
             new RaisedButton(
               onPressed: _launchURL,
               child: new Text("Contact us")
             ),
           ],
         )
       ),
      ) 
    );
  }
}