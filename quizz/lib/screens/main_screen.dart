import 'package:flutter/material.dart';
import 'package:quizz/screens/question_screen.dart';
import 'package:quizz/screens/result_screen.dart';

import '../models/database.dart';
import '../models/question.dart';

class QuizzResult {
  final int count;
  final int wright;
  final int score;

  QuizzResult({
    required this.count,
    required this.wright,
    required this.score,
  });
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Question> _questions = Database.questions;
  int _quizzIndex = 0;
  int _quizzScore = 0;
  int _quizzWright = 0;

  void _optionSelected(Option option) {
    setState(() {
      _quizzScore += _questions[_quizzIndex].value;
      _quizzWright++;
      if (option.correct) {
        _quizzIndex++;
      }
    });
    debugPrint('index = $_quizzIndex');
    debugPrint('score = $_quizzScore');
  }

  @override
  Widget build(BuildContext context) {
    return (_quizzIndex < _questions.length)
        ? QuestionScreen(
            question: _questions[_quizzIndex],
            optionPressed: _optionSelected,
          )
        : ResultScreen(
            result: QuizzResult(
              count: _questions.length,
              wright: _quizzWright,
              score: _quizzScore,
            ),
          );
  }
}
