import 'package:flutter/material.dart';

import '../consts.dart';
import '../models/bmi_data.dart';
import '../widgets/rounded_card.dart';

class ResultPage extends StatelessWidget {
  final BmiData bmiData;

  const ResultPage({
    super.key,
    required this.bmiData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const RoundedCard(
            color: kActiveCardColor,
            child: Text(
              'Seus Resultados',
              style: kBigTitleTextStyle,
            ),
          ),
          Expanded(
            child: RoundedCard(
              color: kInactiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    bmiData.diagnosis.text.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: kDiagnosticTextStyle,
                  ),
                  Text(
                    bmiData.bmi.toStringAsFixed(1).replaceAll('.', ','),
                    textAlign: TextAlign.center,
                    style: kNumberTextStyle.copyWith(
                      fontSize: 64.0,
                    ),
                  ),
                  Text(
                    bmiData.diagnosis.comment,
                    textAlign: TextAlign.center,
                    style: kTitleTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: kButtonActiveColor,
              fixedSize: kButtonSize,
              backgroundColor: kButtonColor,
            ),
            child: const Text(
              'RECALCULAR',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
