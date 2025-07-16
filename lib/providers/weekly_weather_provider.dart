import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/services/api_helper.dart';
import 'package:weather_app/models/weekly_weather.dart';

final weeklyWeatherProvider = FutureProvider.autoDispose((ref) async {
  return ApiHelper.getWeeklyForecast();
});
