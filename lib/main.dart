import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'pages/map.dart';
import 'pages/home.dart';
import 'pages/payment.dart';
import 'pages/history.dart';
import 'pages/help.dart';
import 'pages/barcode.dart';
import 'pages/barcodeInfo.dart';
import 'pages/howToRide/howToRide.dart';
import 'pages/safety.dart';
import 'pages/settings.dart';


void main() {
  GoogleMapController.init();
  final GoogleMapOverlayController controller = GoogleMapOverlayController.fromSize(
    width: 400.0,
    height: 610.0,
    options: GoogleMapOptions(
      cameraPosition: const CameraPosition(
        target: LatLng(59.22026760000001, 18.141623199999998),
        zoom: 1.0,
      )));
  final Widget mapWidget = GoogleMapOverlay(controller: controller);
  runApp(MaterialApp(
    home: new Help(),
    theme: ThemeData.dark(),
    routes: <String, WidgetBuilder>{
     '/home': (BuildContext context) => new Home(),
     '/payment': (BuildContext context) => new Payment(),
     '/history': (BuildContext context) => new History(),
     '/map': (BuildContext context) => new MapsDemo(mapWidget, controller.mapController),
     '/barcode': (BuildContext context) => new Barcode(),
     '/barcodeInfo': (BuildContext context) => new BarcodeInfo(),
     '/help': (BuildContext context) => new Help(),
     '/howToRide': (BuildContext context) => new HowToRide(),
     '/safety': (BuildContext context) => new Safety(),
     '/settings': (BuildContext context) => new Setting(),
    },
    navigatorObservers: <NavigatorObserver>[controller.overlayController],
  ));
}


