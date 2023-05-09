import 'package:bmi/consts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../routes.dart';
import '../models/bmi_data.dart';
import '../widgets/ajustable_value_card.dart';
import '../widgets/icon_text.dart';
import '../widgets/rounded_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Genre _genre = Genre.female;
  int _height = 175;
  int _weight = 55;
  int _age = 38;

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
          Expanded(
            flex: 30,
            child: Row(
              children: [
                Expanded(
                  flex: 50,
                  child: GestureDetector(
                    onTap: () {
                      if (_genre != Genre.male) {
                        setState(() {
                          _genre = Genre.male;
                        });
                      }
                    },
                    child: RoundedCard(
                      color: (_genre == Genre.male)
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: const IconText(
                        icon: FontAwesomeIcons.mars,
                        text: 'HOMEM',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 50,
                  child: GestureDetector(
                    onTap: () {
                      if (_genre != Genre.female) {
                        setState(() {
                          _genre = Genre.female;
                        });
                      }
                    },
                    child: RoundedCard(
                      color: (_genre == Genre.female)
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: const IconText(
                        icon: FontAwesomeIcons.venus,
                        text: 'MULHER',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 35,
            child: RoundedCard(
              color: kInactiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'ALTURA',
                    style: kTitleTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _height.toStringAsFixed(0),
                        style: kNumberTextStyle,
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        'cm',
                        style: kTitleTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  SliderTheme(
                    data: const SliderThemeData(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 12.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 22.0,
                      ),
                    ),
                    child: Slider(
                      onChanged: (value) {
                        setState(() {
                          _height = value.toInt();
                        });
                      },
                      min: 100.0,
                      max: 250.0,
                      value: _height.toDouble(),
                      activeColor: kSliderActiveColor,
                      inactiveColor: kSliderInactiveColor,
                      thumbColor: kSliderThumbColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 35,
            child: Row(
              children: [
                Expanded(
                  child: AjustableValueCard(
                    title: 'PESO',
                    value: _weight,
                    onChanged: (value) {
                      _weight = value;
                    },
                  ),
                ),
                Expanded(
                  child: AjustableValueCard(
                    title: 'IDADE',
                    value: _age,
                    onChanged: (value) {
                      _age = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: TextButton(
              onPressed: () {
                final data = BmiData(
                  genre: _genre,
                  height: _height,
                  weight: _weight,
                  age: _age,
                );

                Navigator.of(context).pushNamed(
                  Routes.result,
                  arguments: data,
                );
              },
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
          ),
        ],
      ),
    );
  }
}
