import 'package:flutter/material.dart';

import 'package:http/http.dart' as http; // for making HTTP calls
import 'dart:convert'; // for converting JSON
import 'dart:async'; // for async/await
import 'dart:io'; // for http headers

class VehicleDisplay extends StatefulWidget {
  const VehicleDisplay({Key? key}) : super(key: key);

  @override
  State<VehicleDisplay> createState() => VehicleDisplayState();
}

class VehicleDisplayState extends State<VehicleDisplay> {
  String res = '';
  void getVehicle() async {
    Uri uri = Uri.parse('http://127.0.0.1:5000/vehicle');
    http.Response response = await http.get(
      uri,
    );
    setState(() {
      res = response.body.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    getVehicle();
    return Scaffold(
        body: Center(
            child: Text(
      res,
    )));
  }
}
