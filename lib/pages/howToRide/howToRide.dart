import 'package:flutter/material.dart';
import '../sideMenu.dart';
import 'howToRideInfo.dart';

final String firstTitle = "Find & Unlock";
final String firstBody = "Find a Rajd near you and tap the button to unlock";
final String firstImage = "images/iphone.png";

final String secondTitle = "Safe Riding";
final String secondBody = "Bring your own helmet to stay safe while you ride";
final String secondImage = "images/helmet.png";

final String thirdTitle = "Start the Rajd";
final String thirdBody = "Kick start three times then the throttle button with the right thumb";
final String thirdImage = "images/scooter2.png";

final String fourthTitle = "Where to Ride";
final String fourthBody = "Ride in bike lanes when available. Do not ride on sidewalks";
final String fourthImage = "images/bikeLane.png";

final String fifthTitle = "Brakes";
final String fifthBody = "Squeeze brake with the left hand to slow down";
final String fifthImage = "images/breaks.png";

final String sixthTitle = "Ending your ride";
final String sixthBody = "Ending your ride by locking the Rajd within the app";
final String sixthImage = "images/iphone.png";

class HowToRide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: new AppBar(title: new Text("HOW TO RIDE")),
     drawer: new SideMenu(),
     body: new PageView(
       children: <Widget>[
         new HowToRideInfo(firstTitle, firstBody, firstImage, 0.0),
         new HowToRideInfo(secondTitle, secondBody, secondImage, 0.2),
         new HowToRideInfo(thirdTitle, thirdBody, thirdImage, 0.4),
         new HowToRideInfo(fourthTitle, fourthBody, fourthImage, 0.6),
         new HowToRideInfo(fifthTitle, fifthBody, fifthImage, 0.8),
         new HowToRideInfo(sixthTitle, sixthBody, sixthImage, 1.0),
       ],
     )
    );
  }
}