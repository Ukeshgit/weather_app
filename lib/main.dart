import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/app/home/view/screen/home.dart';
import 'package:weather_app/common/constants/services/api_helper.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
  print(ApiHelper.getCurrentWeather());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
