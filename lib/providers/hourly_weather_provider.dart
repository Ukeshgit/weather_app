import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/services/api_helper.dart';
import 'package:weather_app/models/hourly_weather.dart';

final hourlyWeatherProvider = FutureProvider.autoDispose<HourlyWeather>((
  ref,
) async {
  return ApiHelper.getHourlyForecast();
});
