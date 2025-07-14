import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class Weatherinfo extends StatelessWidget {
  final Weather weather;
  const Weatherinfo({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WeatherInfoTile(title: weather.main.temp.toString(), value: "dd"),
      ],
    );
  }
}

class WeatherInfoTile extends StatelessWidget {
  String title;
  String value;
  WeatherInfoTile({this.title = "", this.value = ""});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(title), Text(value)]);
  }
}
