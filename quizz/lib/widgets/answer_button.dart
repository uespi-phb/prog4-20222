import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;

  const AnswerButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 5.0,
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}
