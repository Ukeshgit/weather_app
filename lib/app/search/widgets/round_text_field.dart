import 'package:flutter/material.dart';
import 'package:weather_app/common/constants/app_colors.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.accentBlue,
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),

        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
          border: InputBorder.none,
          fillColor: Colors.white,
          focusColor: Colors.white,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
