import 'package:dio/dio.dart';
import 'package:weather_app/common/services/geolocator.dart';

class ApiHelper {
  static const baseurl = "https://api.openweathermap.org/data/2.5/weather";
  static const weeklyWeatherUrl =
      "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m";
  static const String apiKey = "8b4e9b0b0b4e9b0b0b4e9b0b0b4e9b0b";
  static final dio = Dio();
  static double lat = 0.0;
  static double lon = 0.0;
  //Get lat and lon
  static Future<void> fetchLocation() async {
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }

  //build url
  static String _constructionWeatherUrl() {
    return "$baseurl?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
  }
}
