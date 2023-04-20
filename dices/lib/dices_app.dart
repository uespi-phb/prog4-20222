import 'dart:math';

import 'package:flutter/material.dart';

class DicesApp extends StatefulWidget {
  const DicesApp({super.key});

  @override
  State<DicesApp> createState() => _DicesAppState();
}

class _DicesAppState extends State<DicesApp> {
  final rnd = Random();

  int _leftDiceValue = 4;
  int _rightDiceValue = 6;

  void _rollDices() {
    setState(() {
      _leftDiceValue = rnd.nextInt(6) + 1;
      _rightDiceValue = rnd.nextInt(6) + 1;
    });

    debugPrint('Left : $_leftDiceValue');
    debugPrint('Right: $_rightDiceValue');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('**** build()');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dices',
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Rolando Dados'),
        ),
        body: GestureDetector(
          onTap: _rollDices,
          child: Center(
            child: Row(
              children: [
                Expanded(
                  flex: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 10.0,
                    ),
                    child: Image.asset('assets/images/dice$_leftDiceValue.png'),
                  ),
                ),
                Expanded(
                  flex: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 30.0,
                    ),
                    child:
                        Image.asset('assets/images/dice$_rightDiceValue.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
