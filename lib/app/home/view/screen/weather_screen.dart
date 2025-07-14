import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/app/home/view/widgets/hourly_forecast_head.dart';
import 'package:weather_app/app/home/view/widgets/weatherInfo.dart';
import 'package:weather_app/common/constants/text_styles.dart';
import 'package:weather_app/common/extensions/datetime.dart';
import 'package:weather_app/common/widgets/widgets.dart';
import 'package:weather_app/providers/current_weather_provider.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 8, 8, 87)),
    );
    final weatherData = ref.watch(currentWeatherProvider);
    return SafeArea(
      child: Scaffold(
        body: weatherData.when(
          data: (data) {
            return GradientContainer(
              children: [
                SizedBox(width: double.infinity),
                Column(
                  children: [
                    Text(data.name.toString(), style: TextStyles.h1),
                    SizedBox(height: 10),
                    Text(
                      DateTime.now().dateTime.toString(),
                      style: TextStyles.subtitleText,
                    ),
                    SizedBox(height: 30),

                    SizedBox(
                      height: 260,
                      child: Image.asset(
                        "assets/icons/${data.weather[0].icon.replaceAll('n', 'd')}.png",
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      data.weather[0].description.toString(),
                      style: TextStyles.h1,
                    ),
                    SizedBox(height: 30),
                    Weatherinfo(weather: data),
                    SizedBox(height: 30),
                    HourlyForecastHead(),
                    SizedBox(height: 30),
                  ],
                ),
              ],
            );
          },
          error: (error, StackTrace) {
            Text(error.toString());
          },
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
