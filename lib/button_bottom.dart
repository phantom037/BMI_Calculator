import 'package:flutter/material.dart';
import 'constamt.dart';

class BottomButton extends StatelessWidget {
  final Function ontap;
  final String title;
  BottomButton({@required this.ontap, @required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
            child: Text(
          title,
          style: largeButtonTextStyle,
        )),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
