import 'package:bmi/consts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/ajustable_value_card.dart';
import '../widgets/icon_text.dart';
import '../widgets/rounded_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        backgroundColor: kAppBarBackgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: const [
              Expanded(
                flex: 50,
                child: RoundedCard(
                  child: IconText(
                    icon: FontAwesomeIcons.mars,
                    text: 'HOMEM',
                  ),
                ),
              ),
              Expanded(
                flex: 50,
                child: RoundedCard(
                  child: IconText(
                    icon: FontAwesomeIcons.venus,
                    text: 'MULHER',
                  ),
                ),
              ),
            ],
          ),
          RoundedCard(
            child: Column(
              children: [
                const Text(
                  'ALTURA',
                  style: kTitleTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: const [
                    Text(
                      '175',
                      style: kNumberTextStyle,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'cm',
                      style: kTitleTextStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                SliderTheme(
                  data: const SliderThemeData(
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15.0,
                    ),
                    overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 28.0,
                    ),
                  ),
                  child: Slider(
                    onChanged: (value) {},
                    min: 100.0,
                    max: 250.0,
                    value: 170.0,
                    activeColor: kSliderActiveColor,
                    inactiveColor: kSliderInactiveColor,
                    thumbColor: kSliderThumbColor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: const [
              Expanded(
                child: AjustableValueCard(
                  title: 'PESO',
                  value: 50,
                ),
              ),
              Expanded(
                child: AjustableValueCard(
                  title: 'IDADE',
                  value: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: kButtonActiveColor,
              fixedSize: kButtonSize,
              backgroundColor: kButtonColor,
            ),
            child: const Text(
              'CALCULAR',
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
