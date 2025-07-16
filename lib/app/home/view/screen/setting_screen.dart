import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/common/widgets/widgets.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 8, 8, 87)),
    );

    return Scaffold(body: GradientContainer(children: []));
  }
}
