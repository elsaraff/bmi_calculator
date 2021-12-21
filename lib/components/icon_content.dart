import 'package:flutter/material.dart';
import 'package:first_bmi/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 100,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: LargeTextStyle,
        )
      ],
    );
  }
}