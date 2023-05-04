import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../consts.dart';
import './rounded_card.dart';
import './elevated_round_button.dart';

class AjustableValueCard extends StatelessWidget {
  final String title;
  final int value;

  const AjustableValueCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      child: Column(
        children: [
          Text(
            title,
            style: kTitleTextStyle,
          ),
          Text(
            value.toString(),
            style: kNumberTextStyle,
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedRoundButton(
                icon: FontAwesomeIcons.minus,
                onPressed: () {
                  debugPrint('MENOS');
                },
              ),
              ElevatedRoundButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () {
                  debugPrint('MAIS');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
