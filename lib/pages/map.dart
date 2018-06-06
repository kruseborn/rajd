import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocation/geolocation.dart';

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

class ButtonMenu extends StatelessWidget {
  final GoogleMapController _controller;
  final double _iconSize = 30.0;
  final Color _buttonBackGroundColor = Colors.white;
  final Color _iconColor = Colors.white;
  
  ButtonMenu(this._controller);

  @override
  Widget build(BuildContext context) {
  return new Container(
    color: Colors.black87,
    padding: new EdgeInsets.all(4.0),
    child: new Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      new IconButton(
          icon: new Icon(Icons.my_location),
          onPressed: () {
            
           _controller.animateCamera(CameraUpdate.newCameraPosition(
                const CameraPosition(
                  bearing: 270.0,
                  target: LatLng(59.2203, 18.1416),
                  tilt: 30.0,
                  zoom: 13.0,
                ),
              ));
          },
          iconSize: _iconSize,
          color: _iconColor,
      ),
      new FloatingActionButton(
        onPressed: ()=>print("ride"),
        shape: new CircleBorder(),
        child: new Text("Rajd", style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0, fontStyle: FontStyle.italic),),
        backgroundColor: _buttonBackGroundColor,
      ),
      new IconButton(
          icon: new Icon(Icons.close),
          onPressed: (){Navigator.of(context).popAndPushNamed("/home");},
          iconSize: _iconSize,
          color: _iconColor,
      ),
    ],  
  )
  );
  }
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
      body: new Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(child: widget.mapWidget),
            new Expanded(
              child: new ButtonMenu(widget.controller)
            )
          ],
        ),
      ),
    );
  }
}
