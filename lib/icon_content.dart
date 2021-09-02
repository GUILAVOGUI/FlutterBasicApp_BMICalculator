

import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  fontSize: 18,color: Color(0xFF8D8E98),
);

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
          style: labelTextStyle,
        )
      ],
    );
  }
}
