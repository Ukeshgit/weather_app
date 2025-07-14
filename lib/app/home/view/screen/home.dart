import 'package:flutter/material.dart';
import 'package:weather_app/app/home/view/screen/weather_screen.dart';
import 'package:weather_app/app/home/view/screen/search_screen.dart';
import 'package:weather_app/app/home/view/screen/setting_screen.dart';
import 'package:weather_app/app/home/view/screen/sunny_screen.dart';
import 'package:weather_app/common/constants/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  int _currentPageIndex = 0;
  List screens = [
    WeatherScreen(),
    SearchScreen(),
    SunnyScreen(),
    SettingScreen(),
  ];
  final List<NavigationDestination> _destinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined, color: Colors.white),
      selectedIcon: Icon(Icons.home, color: Colors.white),
      label: "",
    ),
    NavigationDestination(
      icon: Icon(Icons.search_outlined, color: Colors.white),
      selectedIcon: Icon(Icons.search, color: Colors.white),

      label: "",
    ),
    NavigationDestination(
      icon: Icon(Icons.wb_sunny_outlined, color: Colors.white),
      selectedIcon: Icon(Icons.wb_sunny, color: Colors.white),
      label: "",
    ),
    NavigationDestination(
      icon: Icon(Icons.settings_outlined, color: Colors.white),
      selectedIcon: Icon(Icons.settings, color: Colors.white),
      label: "",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(backgroundColor: AppColors.secondaryBlack),
        child: NavigationBar(
          destinations: _destinations,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _currentPageIndex,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (value) {
            setState(() {
              _currentPageIndex = value;
            });
          },
        ),
      ),
      body: screens[_currentPageIndex],
      // body: Container(),
    );
  }
}
