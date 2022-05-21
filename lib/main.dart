import 'package:flutter/material.dart';
import 'screens/signin.dart';
import 'screens/vehicle/vehicle_registration.dart';
import 'screens/api_call.dart';
import 'package:digital_vehicle/screens/vehicle/vehicle_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Vehicle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const VehicleDisplay(),
    );
  }
}
