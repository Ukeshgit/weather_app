import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/constants/app_colors.dart';
import 'package:weather_app/common/constants/text_styles.dart';
import 'package:weather_app/common/utils/get_weather_icons.dart';
import 'package:weather_app/providers/get_weather_by_city_name.dart';

class FamousCitiesTile extends ConsumerWidget {
  final int index;
  final String city;

  const FamousCitiesTile({super.key, required this.index, required this.city});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(weatherByCityNameProvider(city));
    return weatherData.when(
      data: (data) {
        return Material(
          color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
          borderRadius: BorderRadius.circular(15),
          elevation: index == 0 ? 8 : 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data.main.temp.round()}°".toString(),
                            style: TextStyles.h2,
                          ),
                          SizedBox(height: 10),
                          Text(
                            data.weather[0].description,
                            overflow: TextOverflow.ellipsis,

                            style: TextStyles.subtitleText,
                            maxLines: 2,
                          ),
                          SizedBox(height: 10),
                          Text(data.name, style: TextStyles.h3),
                        ],
                      ),
                    ),

                    Image.asset(
                      getWeatherIcon(weatherCode: data.weather[0].id),
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading:
          () => Container(
            height: 10,
            width: 20,
            child: const CircularProgressIndicator(),
          ),
    );
  }
}
