import 'package:flutter/material.dart';
import 'sideMenu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'fonts.dart';
import 'package:mailer/mailer.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => new _HelpState();
}

class _HelpState extends State<Help> {
  String _message = "";
  @override
  initState() {
    super.initState();
  }
  // _launchURL() async {
  //   const url =
  //       'mailto:kruseborn@gmail.com?subject=Rajd support&body=New%20plugin';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  void sendMail() {
    // If you want to use an arbitrary SMTP server, go with `new SmtpOptions()`.
    // This class below is just for convenience. There are more similar classes available.
    var options = new GmailSmtpOptions()
      ..username = 'mathforlife83'
      ..password = 'azz7piAQ6';
    // you need to use one of those here.

    // How you use and store passwords is up to you. Beware of storing passwords in plain.

    // Create our email transport.
    var emailTransport = new SmtpTransport(options);
    print("message" + _message);

    // Create our mail/envelope.
  var envelope = new Envelope()
    ..from = 'merni@kth.com'
    ..recipients.add('mathforlife83@gmail.com')
    ..subject = 'Rajd support'
    ..text = _message;


    // Email it.
    emailTransport
        .send(envelope)
        .then((envelope) => print('Email sent!'))
        .catchError((e) => print('Error occurred: $e'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Help", style: fonts.appBarTitle),
          centerTitle: true,
        ),
        drawer: new SideMenu(),
        body: new SingleChildScrollView(
            child: Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new FlutterLogo(
                size: 100.0,
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Text(
                  "Feel free to leave us any message about anything that is on your mind. We will try to answer your questions as soon a possible.",
                  style: Theme.of(context).textTheme.body2),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Text(
                  "To get in contact with the Rajd team, please click the link below",
                  style: Theme.of(context).textTheme.body2),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Container(
                color: Colors.white,
                height: 200.0,
                child: new TextField(
                  maxLines: 10,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(color: Colors.black),
                  decoration: new InputDecoration(
                    hintText: "Message",
                  ),
                  onChanged: (String str) {
                      _message = str;
                  },
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new RaisedButton(
                  onPressed: () {
                    if (_message.length > 0) sendMail();
                  },
                  child: new Text("Contact us")),
            ],
          )),
        )));
  }
}
