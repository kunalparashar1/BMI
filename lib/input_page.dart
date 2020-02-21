import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_Content.dart';
import 'Reuse.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom.dart';
import 'Round_icon.dart';
import 'calculator.dart';




enum Gender{
  Male,
  Female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
    Gender selectedGender;
    int height = 180;
    int weight = 60;
    int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: Reuse(
                onPress: (){
                setState(() {
                  selectedGender = Gender.Male;
                });
              },
                colour: selectedGender == Gender.Male? kactiveCardColor :kinactiveCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.mars,
                  label: 'MALE',
                ),
              ),
              ),
              Expanded(child: Reuse(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.Female;
                  });
                },
                colour: selectedGender == Gender.Female?kactiveCardColor : kinactiveCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.venus,
                  label: 'FEMALE',
                ),
              ),),
            ],
          )),
          Expanded(child: Reuse(
            colour: kactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',
                style: klabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberFont,
                    ),
                    Text(
                      'cm',
                      style: klabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF08D8E98),
                    thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 90.0,
                    max: 240.0,
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: Reuse(
                colour: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: klabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberFont,
                    ),

                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },

                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                        ),

                      ],
                    ),
                  ],
                ),
              ),),
              Expanded(child: Reuse(
                colour: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: klabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberFont,
                    ),

                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },

                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                        ),

                      ],
                    ),
                  ],
                ),
              ),),
            ],
          ),),
          BottomButton( buttonTitle: 'Calculate', onTap: () {

            Calculator calc = Calculator(height: height, weight: weight);

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ResultPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretationText: calc.getInterpret(),
            ),
              ),
            );
          },

    ),
        ],
      )
    );
  }
}






