import 'package:flutter/material.dart';

import '../colors.dart';

class RoundedCard extends StatelessWidget {
  final Widget? child;

  const RoundedCard({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: kActiveCardColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: child,
    );
  }
}
