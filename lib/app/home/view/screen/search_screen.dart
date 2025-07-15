import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/app/home/view/widgets/location_icon.dart';
import 'package:weather_app/app/home/view/widgets/round_text_field.dart';
import 'package:weather_app/common/constants/text_styles.dart';
import 'package:weather_app/common/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 8, 8, 87)),
    );
    return GradientContainer(
      children: [
        Column(
          children: [
            Text("Pick Location", style: TextStyles.h1),
            SizedBox(height: 30),
            Text(
              "Find the area or city that you want to find detail weather info at this time",
              style: TextStyles.subtitleText,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(child: RoundTextField(controller: _controller)),

                SizedBox(width: 15),
                LocationIcon(),
              ],
            ),
            Text("data", style: TextStyles.subtitleText),
          ],
        ),
      ],
    );
  }
}
