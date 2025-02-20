import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String? url;
  NetworkHelper({this.url});

  Future<void> getData() async {
    try {
      var tempUrl = Uri.parse(url!);
      http.Response response = await http.get(tempUrl);

      if (response.statusCode == 200) {
        print("inside response");
        String data = response.body;
        print(data);

        return jsonDecode(data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
