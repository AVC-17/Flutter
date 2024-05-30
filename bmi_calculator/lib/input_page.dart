import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomNavigationHeight = 60.0;
const activeCardColor = Color(0xFF111328);
const inactiveCardColor = Color(0xFF1B1C2C);
const bottomNavigationColor = Color(0xFFEB1555);
Color heightCardColor = inactiveCardColor;
int height = 180;
int weight = 60;
int age = 25;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { Male, Female }

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    colour: selectedGender == Gender.Male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      boxIcon: FontAwesomeIcons.mars,
                      boxText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    colour: selectedGender == Gender.Female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      boxIcon: FontAwesomeIcons.venus,
                      boxText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              colour: heightCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: const TextStyle(
                          fontSize: 50.0,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: const Color(0xFFEB1555),
                    inactiveColor: const Color(0xFF8D8E98),
                    onChanged: (double value) {
                      setState(() {
                        heightCardColor = activeCardColor;
                        height = value.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                            fontSize: 50.0,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RoundActionButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(),
                            Expanded(
                              child: RoundActionButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                            fontSize: 50.0,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RoundActionButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(),
                            Expanded(
                              child: RoundActionButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain bmi =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            result: bmi.calculateBMI(),
                            interpretation: bmi.getInterpretation(),
                            resultText: bmi.getResult(),
                          )));
            },
            child: Container(
              height: bottomNavigationHeight,
              width: double.infinity,
              color: bottomNavigationColor,
              child: const Center(
                child: Text('Calulate'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundActionButton extends StatelessWidget {
  RoundActionButton({required this.icon, required this.onPress});

  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 0.6,
      constraints: const BoxConstraints.tightFor(height: 50.0, width: 50.0),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
