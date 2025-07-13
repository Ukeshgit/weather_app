import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/app/home/view/screen/search_screen.dart';
import 'package:weather_app/app/home/view/screen/setting_screen.dart';
import 'package:weather_app/app/home/view/screen/sunny_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  List screens = [HomeScreen(), SearchScreen(), SunnyScreen(), SettingScreen()];
  final List<NavigationDestination> _destinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: "",
    ),
    NavigationDestination(
      icon: Icon(Icons.search_outlined),
      selectedIcon: Icon(Icons.search),

      label: "",
    ),
    NavigationDestination(
      icon: Icon(Icons.wb_sunny_outlined),
      selectedIcon: Icon(Icons.wb_sunny),
      label: "",
    ),
    NavigationDestination(
      icon: Icon(Icons.settings_outlined),
      selectedIcon: Icon(Icons.settings),
      label: "",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      bottomNavigationBar: NavigationBar(
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
      // body: screens[_currentPageIndex],
      body: Container(),
    );
  }
}
