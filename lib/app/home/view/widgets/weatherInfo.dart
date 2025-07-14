import 'package:flutter/material.dart';
import 'package:weather_app/common/constants/text_styles.dart';
import 'package:weather_app/models/weather.dart';

class Weatherinfo extends StatelessWidget {
  final Weather weather;
  const Weatherinfo({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherInfoTile(title: "Temp", value: weather.main.temp.toString()),
          WeatherInfoTile(
            title: "Wind",
            value: "${weather.wind.speed.toString()}km/hr",
          ),
          WeatherInfoTile(
            title: "Humidity",
            value: "${weather.main.humidity.toString()}%",
          ),
        ],
      ),
    );
  }
}

class WeatherInfoTile extends StatelessWidget {
  String title;
  String value;
  WeatherInfoTile({this.title = "", this.value = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyles.subtitleText),
        Text(value, style: TextStyles.subtitleText),
      ],
    );
  }
}
