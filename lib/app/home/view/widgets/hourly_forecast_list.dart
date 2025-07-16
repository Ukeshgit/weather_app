import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/constants/app_colors.dart';
import 'package:weather_app/common/constants/text_styles.dart';
import 'package:weather_app/common/extensions/int.dart';
import 'package:weather_app/common/utils/get_weather_icons.dart';
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
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,

            scrollDirection: Axis.horizontal,
            itemCount: data.cnt,
            itemBuilder: (context, index) {
              final finaldata = data.list[index];
              return HourlyWeatherTile(
                id: finaldata.weather[0].id,
                hour: finaldata.dt.time,
                temp: finaldata.main.temp.round(),
                isActive: index == 0,
              );
            },
          ),
        );
      },
      error: (error, stackTrace) => Text("$error".toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

class HourlyWeatherTile extends StatelessWidget {
  final int id;
  final String hour;
  final int temp;
  final bool isActive;
  const HourlyWeatherTile({
    super.key,
    required this.id,
    required this.hour,
    required this.temp,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16, top: 12, bottom: 12),
      child: Material(
        color: isActive ? AppColors.lightBlue : AppColors.accentBlue,
        borderRadius: BorderRadius.circular(15),
        elevation: isActive ? 8 : 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(getWeatherIcon(weatherCode: id), width: 50),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(hour, style: TextStyles.subtitleText),
                  Text("$temp°", style: TextStyles.subtitleText),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
