import 'package:flutter/material.dart';

import './info_card.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/person.jpg'),
            ),
            const Text(
              'Fulano de Tal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontFamily: 'Pacifico',
              ),
            ),
            Text(
              'DESENVOLVEDOR FLUTTER',
              style: TextStyle(
                color: Colors.grey.shade200,
                fontSize: 12.0,
                letterSpacing: 2.5,
              ),
            ),
            Divider(
              color: Colors.teal.shade100,
              indent: 100.0,
              endIndent: 100.0,
              height: 20.0,
            ),
            const InfoCard(icon: Icons.phone, text: '+55 86 99321-1020'),
            const InfoCard(icon: Icons.mail, text: 'fulano@company.com'),
          ],
        ),
      ),
    );
  }
}
