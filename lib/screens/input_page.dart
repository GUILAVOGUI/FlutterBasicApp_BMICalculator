
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/buttons.dart';
import 'result_page.dart';

import '../components/icon_content.dart';

enum Gender{
  male,
female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child:ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                  cardChild: ReusableCardChild(
                    gender: 'MALE',
                    icon: FontAwesomeIcons.mars,),
                ),
              ),
              Expanded(
                child:  ReusableCard(

                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                 cardChild: ReusableCardChild(
                   gender: 'FEMALE',
                   icon: FontAwesomeIcons.venus,),
                ),
              ),
            ],

          ),),
          Expanded(child:  ReusableCard(
              colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kUltraTextStyle
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                  ),
                  child: Slider(value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    // activeColor: Color(0xFFEB1555),
                    onChanged: (double newValue) {
                     setState(() {
                       height = newValue.toInt();
                     });
                    },
                  ),
                )

              ],
            ),

          ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                  colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Text(
                    weight.toString(),
                    style: kUltraTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                         setState(() {
                           weight--;
                         });
                       },),
                      SizedBox(width: 20,),
                      RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: () {
                         setState(() {
                           weight++;
                         });
                      },),
                    ],
                  )
                ],
              ),),

              ),
              Expanded(child:  ReusableCard(
                  colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kUltraTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                          setState(() {
                            age--;
                          });
                        },),
                        SizedBox(width: 20,),
                        RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: () {
                          setState(() {
                            age++;
                          });
                        },),
                      ],
                    )
                  ],
                ),

              ),
              ),
            ],
          ),),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              CalculatorBrain calc= CalculatorBrain(height: height,weight: weight);
              print(calc.calculateBMI());
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResultPage(
                  bmiResult:  calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ))

              );
            },
          ),
        ],
      )
      );
  }
}


