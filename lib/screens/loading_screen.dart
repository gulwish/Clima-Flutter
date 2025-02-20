import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima_flutter/services/networking.dart';
import 'package:clima_flutter/screens//location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '710f98dcb08367304c9109b727e28c38';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? tempLati;
  double? tempLongi;

  void determineLocData() async {
    Location loc = Location();
    await loc.getPosition();

    tempLati = loc.lati;
    tempLongi = loc.longi;

    NetworkHelper networkHelper = NetworkHelper(
      url:
          'https://api.openweathermap.org/data/2.5/weather?lat=$tempLati&lon=$tempLongi&appid=$apiKey',
    );
    var weatherData = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen();
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    determineLocData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.blueGrey,
          shape: BoxShape.circle,
          size: 100.0,
        ),
      ),
    );
  }
}
