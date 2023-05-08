import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final Widget? child;
  final Color color;

  const RoundedCard({
    super.key,
    required this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: child,
    );
  }
}
