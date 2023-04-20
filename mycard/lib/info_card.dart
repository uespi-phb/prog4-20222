import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoCard({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.teal,
            size: 12.0,
          ),
          const SizedBox(width: 30.0),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
