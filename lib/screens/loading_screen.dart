import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_flutter/utilities/constants.dart';

import 'package:clima_flutter/screens//location_screen.dart';
import 'package:clima_flutter/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void determineLocData() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => LocationScreen(
              locationWeather: WeatherModel().getWeatherData(),
            ),
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
