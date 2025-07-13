import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weekly_weather.dart';
import 'package:weather_app/services/api_helper.dart';

final weatherByCityNameProvider = FutureProvider.autoDispose
    .family<Weather, String>((ref, String city_name) async {
      return ApiHelper.getWeatherByCityName(city_name: city_name);
    });
