import 'package:flutter/material.dart';
import 'sideMenu.dart';
import "fonts.dart";

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => new _SettingState();
}

class _SettingState extends State<Setting> {
  String _name = "Tobias Kruseborn",
      _email = "kruseborn@gmail.com",
      _phoneNumber = "0725825546";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SETTINGS', style: fonts.appBarTitle),
        centerTitle: true,
      ),
      drawer: new SideMenu(),
      body: new SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(32.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text(_name),
                  accountEmail: new Text(_email),
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage("images/user.jpg"),
                          fit: BoxFit.fill)),
                ),
                new TextField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    hintText: "Name",
                  ),
                  onSubmitted: (String str) {
                    setState(() {
                      if (str.length > 0) _name = str;
                    });
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                ),
                new TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                    hintText: "Email",
                  ),
                  onSubmitted: (String str) {
                    setState(() {
                      if (str.length > 0) _email = str;
                    });
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                ),
                new TextField(
                  keyboardType: TextInputType.phone,
                  decoration: new InputDecoration(
                    hintText: "Phone",
                  ),
                  onSubmitted: (String str) {
                    setState(() {
                      _phoneNumber = str;
                    });
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Log out"),
                      onPressed: () {
                        print("hellor world");
                      },
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
