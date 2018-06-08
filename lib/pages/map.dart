import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
import 'package:flutter/services.dart';

var currentLocation = <String, double>{};
double g_latitude, g_longitude;

//var location = new Location();

void checkGps() async {
 
 g_longitude = 59.22026760000001;
 g_latitude = 18.141623199999998;
  // try {
  //   currentLocation = await location.getLocation;
  //   g_latitude = currentLocation["latitude"];
  //   g_longitude = currentLocation["longitude"];
  //   print(g_longitude.toString() + g_latitude.toString());
  // } on PlatformException {
  //   currentLocation = null;
  // }
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
    color: Theme.of(context).bottomAppBarColor,
    padding: new EdgeInsets.all(4.0),
    child: new Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      new IconButton(
        icon: new Icon(Icons.my_location),
        onPressed: () {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                bearing: 270.0,
                target: LatLng(g_longitude, g_latitude),
                tilt: 30.0,
                zoom: 13.0,
              ),
            ));
          },
          iconSize: _iconSize,
          color: _iconColor,
      ),
      new FloatingActionButton(
        onPressed: (){ Navigator.of(context).popAndPushNamed("/barcode"); },
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
    checkGps();
    print("check gps");
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
