import 'package:flutter/material.dart';
import 'constamt.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final String label;
  IconContainer({@required this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Color(0xff8d8e98),
        ), //Icon
        SizedBox(
          height: 15.0,
        ), //SizedBox
        Text(
          label,
          style: labelTextStyle,
        ) //Text
      ],
    );
  }
}
