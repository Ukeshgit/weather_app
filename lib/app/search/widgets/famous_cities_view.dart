import 'package:flutter/material.dart';
import 'package:weather_app/app/search/widgets/detail_weather_screen.dart';
import 'package:weather_app/app/search/widgets/famous_cities_tile.dart';
import 'package:weather_app/models/famous_cities_model.dart';

class FamousCitiesView extends StatelessWidget {
  const FamousCitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: famousCitiesList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final city = famousCitiesList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailWeatherScreen(city: city.name),
              ),
            );
          },
          child: FamousCitiesTile(index: index, city: city.name),
        );
      },
    );
  }
}
