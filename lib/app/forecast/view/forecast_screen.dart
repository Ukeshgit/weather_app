import 'package:flutter/material.dart';
import 'package:weather_app/app/forecast/widgets/forecast_head.dart';
import 'package:weather_app/app/forecast/widgets/next_forecast_head.dart';
import 'package:weather_app/app/forecast/widgets/weekly_forecast.dart';
import 'package:weather_app/app/home/view/widgets/hourly_forecast_list.dart';
import 'package:weather_app/common/constants/text_styles.dart';
import 'package:weather_app/common/widgets/widgets.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      children: [
        Column(
          children: [
            Text("Forecast Report", style: TextStyles.h1),
            SizedBox(height: 30),
            ForecastHead(),
            SizedBox(height: 30),
            HourlyForecastList(),
            SizedBox(height: 30),
            NextForecastHead(),
            SizedBox(height: 30),
            WeeklyForecast(),
          ],
        ),
      ],
    );
  }
}
