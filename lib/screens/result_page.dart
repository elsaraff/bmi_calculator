import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_bmi/components/reusable_card.dart';
import 'package:first_bmi/constants.dart';
import 'package:first_bmi/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({
    required this.resultText,
    required this.bmiResult,
    required this.interpretation,
  });

  final String resultText;
  final String bmiResult;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text('Your Result', style: kTitleTextStyle),
              ),
            ),
            const SizedBox(height: 30.0),
            Expanded(
              flex: 7,
              child: ReusableCard(
                cardChild: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        interpretation,
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                ),
                colour: activeCardColour,
              ),
            ),
            const SizedBox(height: 30.0),
            BottomButton(
                buttonTitle: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
