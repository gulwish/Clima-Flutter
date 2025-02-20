import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

//import 'package:geolocator_android/geolocator_web.dart';
extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

class Location {
  double? longi;
  double? lati;

  Location({this.longi, this.lati});

  Future<void> getPosition() async {
    LocationPermission permission;
    final LocationSettings locationSettings = WebSettings(
      accuracy: LocationAccuracy.high,
    );

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.',
        );
      }
      try {
        Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings,
        );
        lati = position.latitude.toPrecision(1);
        longi = position.longitude.toPrecision(1);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
