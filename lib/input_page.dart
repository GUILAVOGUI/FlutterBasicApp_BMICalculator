
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const bottomContainerHeight =80.0;
const activeCardColour = Color(0xFF1D1E33);
const bottomContainerColour =  Color(0xFFEB1555);

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
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child:  ReusableCard(
                colour: activeCardColour,
                cardChild: ReusableCardChild(gender: 'MALE',icon: FontAwesomeIcons.mars,),
              ),
              ),
              Expanded(child:  ReusableCard(colour: activeCardColour,
              cardChild: ReusableCardChild(gender: 'FEMALE', icon: FontAwesomeIcons.venus,),
              ),
              ),
            ],

          ),),
          Expanded(child:  ReusableCard(colour: activeCardColour)),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(colour: activeCardColour)),
              Expanded(child:  ReusableCard(colour: activeCardColour)),
            ],
          ),),
          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      )
      );
  }
}
