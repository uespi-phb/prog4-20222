import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../consts.dart';
import './rounded_card.dart';
import './elevated_round_button.dart';

class AjustableValueCard extends StatefulWidget {
  final String title;
  final int value;
  final void Function(int)? onChanged;

  const AjustableValueCard({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  @override
  State<AjustableValueCard> createState() => _AjustableValueCardState();
}

class _AjustableValueCardState extends State<AjustableValueCard> {
  int value = 0;

  @override
  void initState() {
    super.initState();

    value = widget.value;
  }

  void changeState(int delta) {
    setState(() {
      value += delta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      color: kInactiveCardColor,
      child: Column(
        children: [
          Text(
            widget.title,
            style: kTitleTextStyle,
          ),
          Text(
            value.toString(),
            style: kNumberTextStyle,
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedRoundButton(
                icon: FontAwesomeIcons.minus,
                onPressed: () {
                  changeState(-1);
                },
              ),
              ElevatedRoundButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () {
                  changeState(1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
