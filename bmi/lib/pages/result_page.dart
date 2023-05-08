import 'package:flutter/material.dart';

import '../consts.dart';
import '../widgets/rounded_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

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
                children: const [
                  Text(
                    'ABAIXO DO PESO',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '16,9',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Uma descrição mais detalhado do diagnóstico',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
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
