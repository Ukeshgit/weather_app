import 'package:flutter/material.dart';
import 'package:weather_app/common/constants/app_colors.dart';
import 'package:weather_app/common/constants/text_styles.dart';

class HourlyForecastHead extends StatelessWidget {
  const HourlyForecastHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Hourly Forecast", style: TextStyles.h2),
        TextButton(
          onPressed: () {},
          child: Text(
            "View full forecast",
            style: TextStyle(color: AppColors.lightBlue),
          ),
        ),
      ],
    );
  }
}
