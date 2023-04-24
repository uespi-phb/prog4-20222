import 'package:flutter/material.dart';
import 'package:quizz/screens/main_screen.dart';

class ResultScreen extends StatelessWidget {
  final QuizzResult result;
  const ResultScreen({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
