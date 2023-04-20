import 'package:flutter/material.dart';

import './my_card.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyCard',
      home: MyCard(),
    );
  }
}
