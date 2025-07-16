import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/app/forecast/widgets/subscript_text.dart';
import 'package:weather_app/common/constants/app_colors.dart';
import 'package:weather_app/common/constants/text_styles.dart';
import 'package:weather_app/common/extensions/datetime.dart';
import 'package:weather_app/common/utils/get_weather_icons.dart';
import 'package:weather_app/providers/weekly_weather_provider.dart';

class WeeklyForecast extends ConsumerWidget {
  const WeeklyForecast({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyForecastData = ref.watch(weeklyWeatherProvider);
    print(weeklyForecastData);

    return weeklyForecastData.when(
      data: (data) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: data.daily.time.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return WeeklyForecastTile(
              date: data.daily.time[index],
              day: DateTime.parse(data.daily.time[index]).dayOfWeek,
              temp: data.daily.temperature2mMax[index],
              icon: data.daily.weatherCode[index],
            );
          },
        );
      },
      error: (error, stackTrace) => Text("$error".toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

class WeeklyForecastTile extends StatelessWidget {
  final String day;
  final String date;
  final double temp;
  final int icon;
  const WeeklyForecastTile({
    super.key,
    required this.day,
    required this.date,
    required this.temp,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.accentBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(day, style: TextStyles.h3),
              Text(date, style: TextStyles.subtitleText),
            ],
          ),
          SubscriptText(
            text: temp.toString(),
            color: Colors.white,
            superscriptText: "°c",
            superscriptColor: Colors.grey,
          ),
          Image.asset(getWeatherIcon2(icon), width: 50),
        ],

        //icons show
      ),
    );
    ;
  }
}
