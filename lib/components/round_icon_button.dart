import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {required this.icon, required this.onPressed, required this.hTag});

  final IconData icon;
  final Function() onPressed;
  final String hTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: hTag,
      onPressed: onPressed,
      backgroundColor: Color(0xFF4C4F5E),
      child: Icon(
        icon,
        color: Colors.white,
        size: 45.0,
      ),
    );
  }
}
