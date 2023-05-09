enum Genre {
  male,
  female,
}

class Diagnosis {
  final String text;
  final String comment;

  Diagnosis(this.text, this.comment);
}

class BmiData {
  final Genre genre;
  final int height;
  final int weight;
  final int age;

  BmiData({
    required this.genre,
    required this.height,
    required this.weight,
    required this.age,
  });

  double get bmi {
    final height2 = height * height / 10000.0;
    return weight / height2;
  }

  Diagnosis get diagnosis {
    String text;
    String comment;
    double index = bmi;

    if (index < 17.0) {
      text = 'muito abaixo do peso';
      comment = 'Seu peso está muito abaixo do normal. Tente comer mais!';
    } else if (index < 18.49) {
      text = 'abaixo do peso';
      comment = 'Seu peso abaixo do normal. Tente comer um pouco mais!';
    } else if (index < 24.99) {
      text = 'peso normal';
      comment = 'Parabéns! Seu peso está dentro da faixa de normalidade.';
    } else if (index < 29.99) {
      text = 'acima do peso';
      comment =
          'Seu peso está ligeiramente acima do normal. Tente comer menos!';
    } else if (index < 34.99) {
      text = 'obeso';
      comment = 'Seu peso está muito acima do normal. Procure tratamento!';
    } else if (index < 39.99) {
      text = 'obesidade severa';
      comment =
          'Seu peso está muito acima do normal. Isto pode comprometer sua saúde!';
    } else {
      text = 'pé na cova';
      comment = 'Faça seu testamento!';
    }

    return Diagnosis(
      text,
      comment,
    );
  }
}
