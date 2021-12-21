import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}

Gender? selectedGender;
int height = 180;
int weight = 70;
int age = 24;

const activeCardColour = Color(0xFF111328);
const inActiveCardColour = Color(0xFF1D1E33);
const bottomContainerColour = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;

const LargeTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: Colors.white70,
);

const NumTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);
