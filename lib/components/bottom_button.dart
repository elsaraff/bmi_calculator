import 'package:flutter/material.dart';
import 'package:first_bmi/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});

  final Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bottomContainerColour,
          borderRadius: BorderRadius.circular(15)),
      width: double.infinity,
      height: bottomContainerHeight,
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          buttonTitle,
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
