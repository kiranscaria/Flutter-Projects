import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              child: AutoSizeText(
                'YOUR RESULT',
                style: kTitleTextStyle,
                maxLines: 1,
              ),
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Expanded(
            flex: 21,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMIReadingStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: AutoSizeText(
                      interpretation,
                      style: kBodyStyle,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: BottomButton(
              buttonText: 'RE-CALCULATE',
              onTapped: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
