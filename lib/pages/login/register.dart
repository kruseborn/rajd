import 'package:flutter/material.dart';
import '../fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Register();
  }
}

class _Register extends State<Register> {
  String _email;
  String _password;

  final _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      print("Form is invalid");
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        var snackBar = new SnackBar(
          content: new Text("User created successfully"),
          duration: new Duration(seconds: 6),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
        Navigator.of(context).popAndPushNamed("/login");
      } catch (e) {
        var snackBar = new SnackBar(
          content: new Text(e.toString()),
          duration: new Duration(seconds: 6),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("REGISTER", style: fonts.appBarTitle),
        centerTitle: true,
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new Column(
            children: <Widget>[
              new TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(labelText: "Email"),
                validator: (value) {
                  return !value.contains("@") ? "Not a valid email." : null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              new TextFormField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) {
                  return value.length < 6 ? "At least 6 characters" : null;
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
              new Padding(
                padding: EdgeInsets.all(10.0),
              ),
              new RaisedButton(
                child: new Text('Register', style: fonts.button),
                onPressed: validateAndSubmit,
              ),
              new FlatButton(
                child: new Text("Already a user?", style: fonts.button),
                onPressed: () {
                  Navigator.of(context).popAndPushNamed("/login");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
