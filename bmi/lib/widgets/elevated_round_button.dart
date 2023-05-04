import 'package:flutter/material.dart';

import '../consts.dart';

class ElevatedRoundButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  const ElevatedRoundButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: kRoundButtonSplashColor,
        backgroundColor: kRoundButtonColor,
        minimumSize: const Size.fromRadius(kRoundButtonRadius),
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20.0),
      ),
      child: Icon(
        icon,
        size: 36.0,
        weight: 100.0,
        color: Colors.white,
      ),
    );
  }
}
