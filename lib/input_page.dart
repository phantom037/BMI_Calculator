import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_container.dart';
import 'reusable_card.dart';
import 'constamt.dart';
import 'result_page.dart';
import 'button_bottom.dart';
import 'calcualtor_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180, weight = 60, age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffFBE2E2),
              fontSize: 20.0),
        ),
      ), //AppBar
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? activeBoxColor
                      : inactiveBoxColor,
                  cardChild: IconContainer(
                      icon: FontAwesomeIcons.mars, label: "Male"), //Column
                ),
              ), //Expanded1
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? activeBoxColor
                      : inactiveBoxColor,
                  cardChild: IconContainer(
                    icon: FontAwesomeIcons.venus,
                    label: "Female",
                  ),
                ),
              ) //Expanded2
            ],
          )), // Row, outside Expanded
          Expanded(
              child: ReusableCard(
            colour: activeBoxColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundIconButton(
                      icon: FontAwesomeIcons.minus,
                      onPressed: () {
                        setState(() {
                          height--;
                        });
                      },
                    ), //RoundIconButton
                    SizedBox(
                      width: 20.0,
                    ), //SizedBox
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline
                          .alphabetic, // Must have if use baseline in CrossAxisAlignment
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ), //Text
                        SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          'cm',
                          style: labelTextStyle,
                        ), //Text
                      ],
                    ), //Row
                    SizedBox(
                      width: 20.0,
                    ), //SizedBox
                    RoundIconButton(
                      icon: FontAwesomeIcons.plus,
                      onPressed: () {
                        setState(() {
                          height++;
                        });
                      },
                    ), //RoundIconButton
                  ],
                ), //Row

                Slider(
                  value: height.toDouble(),
                  min: 100.0,
                  max: 230.0,
                  activeColor: Colors.black,
                  inactiveColor: Color(0xff8d8e98),
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ), //Slider
              ],
            ),
          )), //Container,
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                colour: activeBoxColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: labelTextStyle,
                    ), //Text
                    Text(
                      weight.toString(),
                      style: numberTextStyle,
                    ), //Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ), //RoundIconButton
                        SizedBox(
                          width: 10.0,
                        ), //SizedBox
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ), //RoundIconButton
                      ],
                    ), //Row
                  ],
                ),
              )), //Expanded1
              Expanded(
                  child: ReusableCard(
                colour: activeBoxColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Age',
                      style: labelTextStyle,
                    ), //Text
                    Text(
                      age.toString(),
                      style: numberTextStyle,
                    ), //Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            }), //RoundIconButton
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            })
                      ],
                    ), //Row
                  ],
                ), //Column
              )) //Expanded2
            ],
          )), // Row, outside Expanded
          BottomButton(
            ontap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: this.height, weight: this.weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
            title: 'CALCULATE',
          )
        ],
      ), //Column
    ); //Scaffold
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
