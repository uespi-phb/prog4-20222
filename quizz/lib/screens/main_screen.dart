import 'package:flutter/material.dart';
import 'package:quizz/screens/question_screen.dart';
import 'package:quizz/screens/result_screen.dart';

import '../models/database.dart';
import '../models/question.dart';

class QuizzResult {
  final int questionCount;
  final int questionWright;
  final int scorePlayer;
  final int scoreTotal;

  QuizzResult({
    required this.questionCount,
    required this.questionWright,
    required this.scorePlayer,
    required this.scoreTotal,
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

  @override
  void initState() {
    super.initState();
    _shuffleQuestions();
  }

  void _shuffleQuestions() {
    _questions.shuffle();
    for (var question in _questions) {
      question.options.shuffle();
    }
  }

  void _optionSelected(Option option) {
    setState(() {
      if (option.correct) {
        _quizzScore += _questions[_quizzIndex].score;
        _quizzWright++;
      }
      _quizzIndex++;
    });
  }

  void _restart() {
    setState(() {
      _quizzIndex = 0;
      _quizzScore = 0;
      _quizzWright = 0;
    });
    _shuffleQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return (_quizzIndex < _questions.length)
        ? QuestionScreen(
            question: _questions[_quizzIndex],
            optionPressed: _optionSelected,
          )
        : ResultScreen(
            restart: _restart,
            result: QuizzResult(
                questionCount: _questions.length,
                questionWright: _quizzWright,
                scorePlayer: _quizzScore,
                scoreTotal: _questions.fold(0, (sum, q) => sum + q.score)),
          );
  }
}
