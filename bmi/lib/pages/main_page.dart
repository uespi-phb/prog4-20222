import 'package:bmi/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        ],
      ),
    );
  }
}
