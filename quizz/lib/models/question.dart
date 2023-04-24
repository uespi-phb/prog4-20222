class Question {
  final String text;
  final List<Option> options;
  final int value;

  const Question({
    required this.text,
    required this.options,
    this.value = 1,
  });
}

class Option {
  final String text;
  final bool correct;

  const Option({
    required this.text,
    required this.correct,
  });
}
