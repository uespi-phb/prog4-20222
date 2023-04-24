import 'package:flutter/material.dart';
import 'package:quizz/widgets/option_button.dart';

import '../models/question.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final OptionPressed optionPressed;

  const QuestionScreen({
    super.key,
    required this.question,
    required this.optionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              question.text,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...question.options.map(
            (option) => OptionButton(
              option: option,
              onPressed: optionPressed,
            ),
          )
        ],
      ),
    );
  }
}
