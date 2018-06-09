import 'package:flutter/material.dart';

class HowToRideInfo extends StatelessWidget {
  HowToRideInfo(this._title, this._body, this._imageName, this._progressValue);
  final String _title, _body, _imageName;
  final double _progressValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: new Container(
       decoration: new BoxDecoration(
         gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter, // 10% of the width, so there are ten blinds.
            colors: [const Color(0xFFcc2b5e), const Color(0xFF753a88)], // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
       ),
       padding: new EdgeInsets.all(32.0),
       child: new Center(
         child: new Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             new Text(
               _title,
                style: new TextStyle(fontFamily: "Raleway", color: Colors.white, fontSize: 40.0)
             ),
             new Padding(
               padding: new EdgeInsets.all(5.0),
             ),
             new Image.asset(_imageName),
             new Padding(
               padding: new EdgeInsets.all(5.0),
             ),
             new Text(
               _body,
               style: new TextStyle(color: Colors.white, fontSize: 17.0)
             ),
             new Expanded(
               child: new Padding(
                 padding: new EdgeInsets.all(1.0),
              ), 
              ),
              new LinearProgressIndicator(
                 value: _progressValue,
             ),
           ],
         )
       ),
      ) 
    );
  }
}