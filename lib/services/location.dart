import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:geolocator_android/geolocator_web.dart';

class Location {
  double? longi;
  double? lati;

  Location({this.longi, this.lati});

  void getPosition() async {
    final LocationSettings locationSettings = WebSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
      maximumAge: Duration(minutes: 5),
    );
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      lati = position.latitude;
      longi = position.longitude;
    } catch (e) {
      print(e.toString());
    }
  }
}
