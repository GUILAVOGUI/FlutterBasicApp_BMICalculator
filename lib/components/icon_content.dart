

import 'package:bmi_calculator/components/constants.dart';
import 'package:flutter/material.dart';




class ReusableCardChild extends StatelessWidget {

  ReusableCardChild({this.gender,this.icon});

  final String gender;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Icon(
          icon,
          size: 80,)
        ,SizedBox(height: 15,),
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
