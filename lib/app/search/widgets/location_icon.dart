import 'package:flutter/material.dart';
import 'package:weather_app/common/constants/app_colors.dart' show AppColors;

class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.accentBlue,
      ),
      child: const Icon(Icons.location_on_outlined, color: Colors.white),
    );
  }
}
