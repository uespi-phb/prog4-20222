import 'package:flutter/material.dart';

import '../widgets/answer_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Esta e uma pergunta qualquer a ser respondida no nosso aplicativo?',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AnswerButton(text: 'Resposta #1'),
          AnswerButton(text: 'Resposta #2'),
          AnswerButton(text: 'Resposta #3'),
          AnswerButton(text: 'Resposta #4'),
        ],
      ),
    );
  }
}
