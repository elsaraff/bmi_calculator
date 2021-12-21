import 'package:flutter/material.dart';
import 'package:first_bmi/constants.dart';
import 'package:first_bmi/components/icon_content.dart';
import 'package:first_bmi/components/reusable_card.dart';
import 'package:first_bmi/components/round_icon_button.dart';
import 'package:first_bmi/components/bottom_button.dart';
import 'package:first_bmi/screens/result_page.dart';
import 'package:first_bmi/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? inActiveCardColour
                        : activeCardColour,
                    cardChild: IconContent(
                      icon: Icons.male_sharp,
                      label: 'MALE',
                    ),
                  ),
                )),
                const SizedBox(width: 10.0),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? inActiveCardColour
                        : activeCardColour,
                    cardChild: IconContent(
                      icon: Icons.female_sharp,
                      label: 'FEMALE',
                    ),
                  ),
                ))
              ],
            )),
            const SizedBox(height: 10.0),
            Expanded(
              child: ReusableCard(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: LargeTextStyle),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: NumTextStyle,
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFF8D8E80),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderThumbShape(enabledThumbRadius: 20),
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: LargeTextStyle),
                      const SizedBox(height: 10.0),
                      Text(
                        weight.toString(),
                        style: NumTextStyle,
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            hTag: "btn1",
                            icon: Icons.remove_sharp,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          RoundIconButton(
                              hTag: "btn2",
                              icon: Icons.add_sharp,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                )),
                const SizedBox(width: 10.0),
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: LargeTextStyle),
                      const SizedBox(height: 10.0),
                      Text(
                        age.toString(),
                        style: NumTextStyle,
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            hTag: "btn3",
                            icon: Icons.remove_sharp,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          RoundIconButton(
                            hTag: "btn4",
                            icon: Icons.add_sharp,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            )),
            const SizedBox(height: 10.0),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
