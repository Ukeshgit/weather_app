import 'package:flutter/material.dart';
import 'package:weather_app/app/home/view/widgets/famous_cities_tile.dart';
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
        return FamousCitiesTile(index: index, city: city.name);
      },
    );
  }
}
