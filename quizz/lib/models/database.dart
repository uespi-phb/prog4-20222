import './question.dart';

class Database {
  static final questions = [
    Question(
      score: 5,
      text: 'Qual a capital do Egito?',
      options: [
        const Option(text: 'Casablanca', correct: false),
        const Option(text: 'Cairo', correct: true),
        const Option(text: 'Luanda', correct: false),
        const Option(text: 'Argel', correct: false),
      ],
    ),
    Question(
      score: 3,
      text: 'Qual a nota musical identificada por D#',
      options: [
        const Option(text: 'Dó sustenido', correct: false),
        const Option(text: 'Ré sustenido', correct: true),
        const Option(text: 'Sol bemol', correct: false),
        const Option(text: 'Si bemol', correct: false),
      ],
    ),
    Question(
      score: 2,
      text: 'Qual a linguagem de programação utilizada pelo framework Flutter?',
      options: [
        const Option(text: 'Dart', correct: true),
        const Option(text: 'Flutter', correct: false),
        const Option(text: 'Java', correct: false),
        const Option(text: 'Javascript', correct: false),
      ],
    ),
    Question(
      score: 8,
      text: 'Quem escreveu o livro 1984?',
      options: [
        const Option(text: 'George Orwell', correct: true),
        const Option(text: 'Herman Melville', correct: false),
        const Option(text: 'Ernest Hemingway', correct: false),
        const Option(text: 'Jane Austin', correct: false),
      ],
    ),
    Question(
      score: 6,
      text: 'Quem foi a primeira pessoa a viajar no Espaço?',
      options: [
        const Option(text: 'Yuri Gagarin', correct: true),
        const Option(text: 'A cadela Laika', correct: false),
        const Option(text: 'Neil Armstrong', correct: false),
        const Option(text: 'Marcos Pontes', correct: false),
      ],
    ),
    Question(
      score: 1,
      text: 'Que país tem o formato de uma bota?',
      options: [
        const Option(text: 'Itália', correct: true),
        const Option(text: 'Butão', correct: false),
        const Option(text: 'Portugal', correct: false),
        const Option(text: 'México', correct: false),
      ],
    ),
  ];

  static int get scoreTotal => questions.fold(
        0,
        (sum, q) => sum + q.score,
      );

  // static int scoreTotal() {
  //   int total = 0;

  //   for (var question in questions) {
  //     total += question.score;
  //   }
  //   return total;
  // }
}
