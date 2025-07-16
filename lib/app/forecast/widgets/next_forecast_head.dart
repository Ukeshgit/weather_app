import 'package:flutter/material.dart';
import 'package:weather_app/common/constants/text_styles.dart';

class NextForecastHead extends StatelessWidget {
  const NextForecastHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Next Forecast", style: TextStyles.h2),
        Icon(Icons.calendar_month_outlined, color: Colors.white),
      ],
    );
  }
}
