import 'package:flutter/material.dart';

import '../models/question.dart';

typedef OptionPressed = void Function(Option);

class OptionButton extends StatelessWidget {
  final Option option;
  final OptionPressed onPressed;

  const OptionButton({
    super.key,
    required this.option,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 5.0,
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressed(option);
        },
        child: Text(option.text),
      ),
    );
  }
}
