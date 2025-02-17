import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:clima_flutter/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void determinePosition() async {
    Location loc = Location();
    loc.getPosition();
    print(loc.longi);
    print(loc.lati);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init");
    determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    print("inside build method");
    return Scaffold();
  }
}
