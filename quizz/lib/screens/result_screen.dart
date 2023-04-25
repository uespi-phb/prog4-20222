import 'package:flutter/material.dart';
import 'package:quizz/screens/main_screen.dart';

enum Category {
  iron,
  bronze,
  silver,
  gold;

  String get text {
    switch (this) {
      case Category.iron:
        return 'FERRO';
      case Category.bronze:
        return 'BRONZE';
      case Category.silver:
        return 'PRATA';
      case Category.gold:
        return 'OURO';
    }
  }
}

class ResultScreen extends StatelessWidget {
  final QuizzResult result;
  final void Function() restart;

  const ResultScreen({
    super.key,
    required this.result,
    required this.restart,
  });

  String _getCategory() {
    Category category;
    var score = result.questionWright / result.questionCount;

    if (score < 0.25) {
      category = Category.iron;
    } else if (score < 0.50) {
      category = Category.bronze;
    } else if (score < 0.50) {
      category = Category.silver;
    } else {
      category = Category.gold;
    }

    return category.text;
  }

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Questões',
            textAlign: TextAlign.center,
            style: style,
          ),
          Text(
            '${result.questionWright} / ${result.questionCount}',
            textAlign: TextAlign.center,
            style: style,
          ),
          const SizedBox(height: 24.0),
          const Text(
            'Pontuação',
            textAlign: TextAlign.center,
            style: style,
          ),
          Text(
            '${result.scorePlayer} / ${result.scoreTotal}',
            textAlign: TextAlign.center,
            style: style,
          ),
          const SizedBox(height: 24.0),
          const Text(
            'Classificação',
            textAlign: TextAlign.center,
            style: style,
          ),
          Text(
            _getCategory(),
            textAlign: TextAlign.center,
            style: style,
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ElevatedButton(
              onPressed: restart,
              child: const Text('Jogar Novamente'),
            ),
          ),
        ],
      ),
    );
  }
}
