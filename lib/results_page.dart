import 'package:flutter/material.dart';
import 'main.dart';
import 'constants.dart';
import 'Reuse.dart';
import 'bottom.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult, @required this.interpretationText, @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretationText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('BMI CALCULATOR',
      ),
    ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Your Result',
                style: kTitleFont,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reuse(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      resultText.toUpperCase(),
                    style: kResultsFont,
                  ),
                  Text(
                    bmiResult,
                    style: kBmiFont,
                  ),
                  Text(
                    interpretationText,
                    textAlign: TextAlign.center,
                    style: kstatementFont,
                  )

                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: 'Re-Calculate',
            onTap: () {
            Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
