import 'package:bmi_calculator/constamt.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'button_bottom.dart';
import 'input_page.dart';
import 'calcualtor_brain.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffFBE2E2),
              fontSize: 20.0),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: titleTextStyle,
              ),
            ),
          ), //Expanded
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeBoxColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: resultTextStyle,
                  ), //Text
                  Text(
                    bmiResult,
                    style: bmiTextStyle,
                  ), //Text
                  Text(
                    interpretation,
                    style: bodyTextStyle,
                    textAlign: TextAlign.center,
                  ), //Text
                ],
              ), //Column
            ),
          ), //Expanded
          BottomButton(
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              title: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
