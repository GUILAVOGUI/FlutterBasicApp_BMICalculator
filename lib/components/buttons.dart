


import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {

  final Function onTap;
  final String buttonTitle;

  BottomButton({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            buttonTitle,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  // const RoundIconButton({Key? key}) : super(key: key);

  final IconData icon;
  final Function onPressed;
  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon) ,
      elevation: 20,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
    );
  }
}
