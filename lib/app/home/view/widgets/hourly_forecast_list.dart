import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/constants/text_styles.dart';
import 'package:weather_app/models/hourly_weather.dart';
import 'package:weather_app/providers/hourly_weather_provider.dart';

class HourlyForecastList extends ConsumerWidget {
  const HourlyForecastList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyWeatherData = ref.watch(hourlyWeatherProvider);
    return hourlyWeatherData.when(
      data: (data) {
        return Container(
          height: 333,
          child: ListView.builder(
            shrinkWrap: true,

            scrollDirection: Axis.horizontal,
            itemCount: data.cnt,
            itemBuilder: (context, index) {
              final finaldata = data.list[index];
              return HourlyWeatherTile(data: finaldata);
            },
          ),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

class HourlyWeatherTile extends StatelessWidget {
  final WeatherEntry data;
  const HourlyWeatherTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Column(children: [Text(data.dtTxt, style: TextStyles.h1)]),
    );
  }
}
