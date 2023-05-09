import 'package:bmi/consts.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconText({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          size: 48.0,
        ),
        const SizedBox(height: 8.0),
        Text(
          text,
          style: kTitleTextStyle,
        ),
      ],
    );
  }
}
