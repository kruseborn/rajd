import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'pages/mapPage.dart';

void main() {

  GoogleMapController.init();
  final GoogleMapOverlayController controller = GoogleMapOverlayController.fromSize(
    width: 400.0,
    height: 550.0,
    options: GoogleMapOptions(
      cameraPosition: const CameraPosition(
        target: LatLng(59.22026760000001, 18.141623199999998),
        zoom: 1.0,
      )));

  final Widget mapWidget = GoogleMapOverlay(controller: controller);
  runApp(MaterialApp(
    home: new MapsDemo(mapWidget, controller.mapController),
    navigatorObservers: <NavigatorObserver>[controller.overlayController],
  ));
}

