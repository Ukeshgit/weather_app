import 'package:flutter/material.dart';
import 'package:weather_app/app/home/view/screen/home.dart';
import 'package:weather_app/common/constants/app_colors.dart';
import 'package:weather_app/common/constants/text_styles.dart';
import 'package:weather_app/common/widgets/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // Future.delayed(
    //   const Duration(seconds: 3),
    //   () => Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => Home()),
    //   ),
    // );
    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.black,
              AppColors.secondaryBlack,
              AppColors.secondaryBlack.withOpacity(.99),
              AppColors.secondaryBlack.withOpacity(.98),
              AppColors.secondaryBlack.withOpacity(.97),
              AppColors.secondaryBlack.withOpacity(.96),
              AppColors.secondaryBlack.withOpacity(.95),
              AppColors.secondaryBlack.withOpacity(.94),
              AppColors.secondaryBlack.withOpacity(.93),
              AppColors.secondaryBlack.withOpacity(.92),
              AppColors.secondaryBlack.withOpacity(.91),
              AppColors.secondaryBlack.withOpacity(.90),
              AppColors.darkBlue,
              AppColors.accentBlue,
              AppColors.lightBlue,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/app_icon.png", height: 100, width: 100),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
