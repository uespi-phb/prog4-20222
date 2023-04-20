class Question {
  final int value;
  final String text;
  final List<Option> options;

  const Question({
    this.value = 1,
    required this.text,
    required this.options,
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
