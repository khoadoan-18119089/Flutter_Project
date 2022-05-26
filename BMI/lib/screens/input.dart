import 'package:bmi/brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Icon_Context.dart';
import '../Reusable_Card.dart';
import '../constants.dart';
import '../Round_Icon_Button.dart';
import 'result_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  Gener? gener;
  int height = 120;
  int weight = 74;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        gener = Gener.male;
                        FirebaseFirestore firebaseFirestore =
                            FirebaseFirestore.instance;

                      });
                    },
                    Colour: gener == Gener.male ? colour : inactiveCardColor,
                    cardchild: IconContext(
                      icons: FontAwesomeIcons.mars,
                      laber: "MALE",
                      colourText: gener == Gener.male
                          ? Colors.white
                          : inactiveTextColor,
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  onTap: () {
                    setState(() {
                      gener = Gener.female;
                    });
                  },
                  cardchild: IconContext(
                    icons: FontAwesomeIcons.venus,
                    laber: 'FEMALE',
                    colourText: gener == Gener.female
                        ? Colors.white
                        : inactiveTextColor,
                  ),
                  Colour: gener == Gener.female ? colour : inactiveCardColor,
                ))
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            Colour: colour1,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: LaberStyte,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: numberText,
                    ),
                    const Text(
                      ' cm',
                      style: LaberStyte,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEA1556),
                      overlayColor: const Color(0x29EA1556),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30)),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    Colour: colour2,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: LaberStyte,
                        ),
                        Text(
                          weight.toString(),
                          style: numberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  Colour: colour2,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: LaberStyte,
                      ),
                      Text(
                        age.toString(),
                        style: numberText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            iconData: FontAwesomeIcons.minus,
                            onpress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            iconData: FontAwesomeIcons.plus,
                            onpress: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          Container(
            color: heightBoxColor,
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: heightBox,
            child: GestureDetector(
              onTap: () {
                brain calo = brain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                            interpretation: calo.getInterpretation(),
                            bmiResult: calo.Bmi(),
                            resultText: calo.getresult())));
              },
              child: const Center(
                child: Text(
                  'CALCULATE YOUR BMI',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
