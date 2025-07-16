import 'package:flutter/material.dart';

class SubscriptText extends StatelessWidget {
  final String text;
  final String superscriptText;
  final Color color;
  final Color superscriptColor;

  const SubscriptText({
    super.key,
    required this.text,
    required this.superscriptText,
    required this.color,
    required this.superscriptColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          superscriptText,
          style: TextStyle(color: superscriptColor, fontSize: 18),
        ),
      ],
    );
  }
}
