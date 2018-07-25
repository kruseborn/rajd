import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        color: Colors.black,
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
            new IconButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed("/barcode");
              },
              icon: new Icon(FontAwesomeIcons.qrcode),
              iconSize: _iconSize + 10,
            ),
            new IconButton(
              icon: new Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).popAndPushNamed("/home");
              },
              iconSize: _iconSize,
              color: _iconColor,
            ),
          ],
        ));
  }
}

class MapsDemo extends StatefulWidget {
  MapsDemo();

  @override
  _MapsDemoState createState() => new _MapsDemoState();
}

class _MapsDemoState extends State<MapsDemo> {
  GoogleMapOverlayController _controller;
  Widget _mapWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkGps();
    print("check gps");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    _controller = GoogleMapOverlayController.fromSize(
      width: size.width,
      height: size.height * 0.9,
      options: GoogleMapOptions(
        trackCameraPosition: true,
        cameraPosition: const CameraPosition(
          target: LatLng(59.22026760000001, 18.141623199999998),
          zoom: 1.0,
        ),
      ),
    );
    _mapWidget = GoogleMapOverlay(controller: _controller);
    _controller.overlayController.activateOverlay();
    return Scaffold(
      body: new Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Center(child: _mapWidget),
            new Expanded(
              child: new ButtonMenu(_controller.mapController),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.overlayController.deactivateOverlay();
    super.dispose();
  }
}
