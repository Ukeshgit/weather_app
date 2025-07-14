import 'package:dio/dio.dart';
import 'package:weather_app/common/services/geolocator.dart';
import 'package:weather_app/models/hourly_weather.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weekly_weather.dart';

import '../constants.dart';

class ApiHelper {
  static const baseurl = "https://api.openweathermap.org/data/2.5";
  static const weeklyWeatherUrl =
      "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m";

  static final dio = Dio();
  static double lat = 0.0;
  static double lon = 0.0;
  //Get lat and lon
  static Future<void> fetchLocation() async {
    //static method can only access the static variable
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }

  //build url
  static String _constructionWeatherUrl() {
    return "$baseurl/weather?lat=$lat&lon=$lon&appid=${Constants.apiKey}&units=metric";
  }

  static String _constructForecastUrl() {
    return "$baseurl/forecast?lat=$lat&lon=$lon&appid=${Constants.apiKey}&units=metric";
  }

  static String _constructWeatherByCityName(String city_name) {
    return "$baseurl/weather?q=$city_name&appid=${Constants.apiKey}&units=metric";
  }

  static String _constructWeeklyForecastUrl() {
    return "$weeklyWeatherUrl&latitude=$lat&longitude=$lon&timezone=auto";
  }

  //fetch data for a url
  static Future<Map<String, dynamic>> fetchdata(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Error fetching data");
      }
    } catch (e) {
      print("Error fetching data from a $url :$e");
      throw Exception("Error fetching data");
    }
  }

  //current weather
  static Future<Weather> getCurrentWeather() async {
    await fetchLocation();
    final url = _constructionWeatherUrl();
    final response = await fetchdata(url);

    return Weather.fromJson(response);
  }

  static Future getHourlyForecast() async {
    await fetchLocation();
    final url = _constructForecastUrl();
    final response = await fetchdata(url);
    print(response);
    return HourlyWeather.fromJson(response);
  }

  static Future getWeeklyForecast() async {
    await fetchLocation();
    final url = _constructWeeklyForecastUrl();
    final response = await fetchdata(url);
    print(response);
    return WeeklyWeather.fromJson(response);
  }

  static Future<Weather> getWeatherByCityName({
    required String city_name,
  }) async {
    await fetchLocation();
    final url = _constructWeatherByCityName(city_name);
    final response = await fetchdata(url);
    print(response);
    return Weather.fromJson(response);
  }
}
