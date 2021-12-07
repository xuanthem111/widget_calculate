import 'package:flutter/material.dart';
import 'package:widget_easy/widget/components/button_bottom.dart';
import 'package:widget_easy/widget/components/button_weight_age.dart';
import 'package:widget_easy/widget/components/icon_content.dart';
import 'package:widget_easy/widget/components/sex_card.dart';
import 'package:widget_easy/widget/result/results_page.dart';
import 'package:widget_easy/widget/utils/calculator.dart';
import 'package:widget_easy/widget/utils/constans.dart';

enum Gender { male, female }

class AppRunScreen extends StatelessWidget {
  const AppRunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AppRun());
  }
}

class AppRun extends StatefulWidget {
  const AppRun({Key? key}) : super(key: key);

  @override
  _AppRunState createState() => _AppRunState();
}

class _AppRunState extends State<AppRun> {
  Gender? selectedGender;
  int weight = 60;
  int currentSliderValue = 180;
  int age = 20;

  int changeValue = 0;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFF111328),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeaderSex(),
              buildSliderValue(),
              buildBodyWeight(),
              buildBottom()
            ],
          ),
        ],
      ),
    );
  }

  buildHeaderSex() {
    return Container(
      height: 230,
      child: Row(
        children: [
          Expanded(
              child: SexCardButton(
            onPress: () {
              setState(() {
                selectedGender = Gender.male;
              });
            },
            color: selectedGender == Gender.male
                ? kActiveCardColour
                : kInactiveCardColour,
            cardChild: IconContent(
              icon: Icons.male,
              label: 'Male',
            ),
          )),
          Expanded(
              child: SexCardButton(
            onPress: () {
              setState(() {
                selectedGender = Gender.female;
              });
            },
            color: selectedGender == Gender.female
                ? kActiveCardColour
                : kInactiveCardColour,
            cardChild: IconContent(
              icon: Icons.female,
              label: 'Female',
            ),
          )),
        ],
      ),
    );
  }

  buildBodyLayout(int value) {
    return Column(children: [
      Row(
        children: [
          RaisedButton(
              child: Text("Increase Value"),
              onPressed: () {
                value = value + 1;
                print(value); //THIS SHOULD SET STATE
              }),
          SizedBox(
            width: 10,
          ),
          RaisedButton(
              child: Text("Decrease Value"),
              onPressed: () {
                value = value - 1;
                print(value); //THIS SHOULD SET STATE
              })
        ],
      )
    ]);
  }

  Widget buildSliderValue() {
    return Container(
        width: 380,
        height: 180,
        child: Card(
          elevation: 11,
          color: Color(0xFF1D1E33),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "HEIGHT",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "$currentSliderValue Cm",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Colors.white,
                thumbColor: Color(0xFFEB1555),
                overlayColor: Color(0x29EB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
              ),
              child: Slider(
                  value: currentSliderValue.toDouble(),
                  min: 0,
                  max: 300,
                  label: currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      currentSliderValue = value.round();
                      print(value);
                    });
                  }),
            )
          ]),
        ));
  }

  buildBodyWeight() {
    return Expanded(
      child: Row(
        children: [
          Container(
              child: Expanded(
            child: SexCardButton(
              color: Color(0xFF1D1E33),
              cardChild: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    "WEIGHT",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    weight.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWeightHeight(
                        icon: Icons.add,
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ButtonWeightHeight(
                        icon: Icons.track_changes,
                        onPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
              onPress: () {},
            ),
          )),
          Container(
              child: Expanded(
            child: SexCardButton(
              color: Color(0xFF1D1E33),
              cardChild: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    "AGE",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    age.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWeightHeight(
                        icon: Icons.add,
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ButtonWeightHeight(
                        icon: Icons.track_changes,
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
              onPress: () {},
            ),
          )),
        ],
      ),
    );
  }

  buildBottom() {
    return ButtonBottom(
      buttonTitle: 'CALCULATE',
      onTap: () {
        Calculator calc =
            Calculator(weight: weight, height: currentSliderValue);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    )));
      },
    );
  }
}
