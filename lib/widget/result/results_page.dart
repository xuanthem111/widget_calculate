import 'package:flutter/material.dart';
import 'package:widget_easy/widget/components/button_bottom.dart';
import 'package:widget_easy/widget/components/sex_card.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        Expanded(
            flex: 5,
            child: SexCardButton(
              color: Color(0xFF111328),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  )
                ],
              ),
              onPress: () {},
            )),
        ButtonBottom(
          buttonTitle: 'RE-CALCULATE',
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
