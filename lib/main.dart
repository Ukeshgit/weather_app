import 'package:flutter/material.dart';
import 'package:weather_app/services/api_helper.dart';

void main() {
  runApp(const MainApp());
  print(ApiHelper.getCurrentWeather());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text('Weather App'))),
    );
  }
}
