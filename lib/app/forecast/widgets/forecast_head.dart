import 'package:flutter/material.dart';
import 'package:weather_app/app/home/view/widgets/hourly_forecast_list.dart';
import 'package:weather_app/common/constants/text_styles.dart';
import 'package:weather_app/common/extensions/datetime.dart';

class ForecastHead extends StatelessWidget {
  const ForecastHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Today", style: TextStyles.h2),
        Text(
          DateTime.now().dateTime.toString(),
          style: TextStyles.subtitleText,
        ),
      ],
    );
  }
}
