import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:geolocation/geolocation.dart';

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

checkGps() async {
final GeolocationResult result = await Geolocation.requestLocationPermission(const LocationPermission(
  android: LocationPermissionAndroid.fine, 
  ios: LocationPermissionIOS.always,
  ));
  if(result.isSuccessful) {
    print("success gps");
  } else {
    print("not success gps");
  }
  final GeolocationResult result2 = await Geolocation.isLocationOperational();
if(result2.isSuccessful) {
  print("location service is enabled, and location permission is granted");
} else {
  print("location service is not enabled");
  
  LocationResult result3 = await Geolocation.lastKnownLocation();

  if (result3.isSuccessful) {
  // location request successful, location is guaranteed to not be null 
    double lat = result3.location.latitude;
    double lng = result3.location.longitude;
    print("kocko");
    print(lat.toString() + "  " + lng.toString());
  }
  else {
    print("rputt");
  }

  // location service is not enabled, restricted, or location permission is denied
}
  getLocation();
}

double g_latitude, g_longitude;

void getLocation() {
  print("get location");
  Geolocation.currentLocation(accuracy: LocationAccuracy.best).listen((result) {
    if(!result.isSuccessful) {
      print("not successful");
    }
    print("here we are");
    g_latitude = result.location.latitude;
    g_longitude = result.location.longitude; 
    print(g_latitude.toString() + " " + g_longitude.toString());
  });
}


class MapsDemo extends StatefulWidget {
  MapsDemo(this.mapWidget, this.controller);

  final Widget mapWidget;
  final GoogleMapController controller;

  @override
  _MapsDemoState createState() => new _MapsDemoState();
}

class _MapsDemoState extends State<MapsDemo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("check gps");
    checkGps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rajd')),
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
      body: new Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(child: widget.mapWidget),
            RaisedButton(
              child: const Text('Rajd'),
              onPressed: () {
                print("on pressed");
                print(g_latitude.toString() + " " + g_longitude.toString());
                widget.controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  bearing: 270.0,
                  target: LatLng(g_longitude, g_latitude),
                  tilt: 30.0,
                  zoom: 13.0,
                  ),
                ));

                 widget.controller.addMarker(MarkerOptions(
                   position: LatLng(59.22026760000001, 18.141623199999998)
                 ));
                 widget.controller.addMarker(MarkerOptions(
                   position: LatLng(59.22026760000001, 18.171623199939998)
                 ));
                 widget.controller.addMarker(MarkerOptions(
                   position: LatLng(59.22426760000001, 18.171623199939998)
                 ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
