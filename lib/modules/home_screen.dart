import 'package:bmi/shared/components/constants/calculator_brain.dart';
import 'package:bmi/modules/result_screen.dart';
import 'package:bmi/shared/components/constants/rounded_icon_button.dart';
import 'package:bmi/shared/components/constants/theme.dart';
import 'package:flutter/material.dart';

import '../shared/components/constants/bottom_button.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'ResultScreen';

  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  int height = 120;
  int age = 16;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor:Colors.transparent,
      ),
      body: Column(
        children: [
          // Gender
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage('assets/images/male.png'),
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('MALE', style: kLabelTextStyle),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: isMale ? kActiveCardColour : kInactiveCardColour,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage('assets/images/female.png'),
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('FEMALE', style: kLabelTextStyle),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color:
                            !isMale ? kActiveCardColour : kInactiveCardColour,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          // Height Slider
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: kActiveCardColour,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.round().toString(),
                            style: kNumberTextStyle),
                        const Text(
                          'CM',
                          style: kLabelTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 80.0,
                          max: 220.0,
                          onChanged: (value) {
                            setState(() {
                              height = value.toInt();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Age
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: kActiveCardColour,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style:
                            kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: Icons.remove, onPressed: (){
                                setState(() {
                                  age --;
                                });
                              }),
                              RoundIconButton(icon: Icons.add, onPressed: (){
                                setState(() {
                                  age ++;
                                });
                              }),
                              // FloatingActionButton(
                              //   onPressed: () {
                              //     setState(() {
                              //       age--;
                              //     });
                              //   },
                              //   heroTag: 'Age -',
                              //   mini: true,
                              //   child: const Icon(Icons.remove),
                              // ),
                              // FloatingActionButton(
                              //   onPressed: () {
                              //     setState(() {
                              //       age++;
                              //     });
                              //   },
                              //   heroTag: 'Age +',
                              //   mini: true,
                              //   child: const Icon(Icons.add),
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: kActiveCardColour,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: Icons.remove, onPressed: (){
                                setState(() {
                                  weight --;
                                });
                              }),
                              RoundIconButton(icon: Icons.add, onPressed: (){
                                setState(() {
                                  weight ++;
                                });
                              }),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    BottomButton(
    buttonTitle: 'CALCULATE',
    onTap: () {
    CalculatorBrain calc =
    CalculatorBrain(height: height, weight: weight);

    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Result(
    bmi: calc.calculateBMI(),
    result: calc.getResult(),
    interpretation: calc.getInterpretation(),
    )));      })],
      ),
    );
  }
}
