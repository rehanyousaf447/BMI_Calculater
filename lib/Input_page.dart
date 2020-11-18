import 'package:bmi_calculator/ConvertorPage.dart';
import 'package:bmi_calculator/Result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Main_Logos.dart';
import 'MainButtons.dart';
import 'constants.dart';
import 'Roundes_button.dart';
import 'Bottom_button.dart';
import 'Bmi_Calculation.dart';
import 'Globals.dart' as globals;
import 'package:rflutter_alert/rflutter_alert.dart';


class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() {
     print("INPUT PAGE");
   return _InputPageState();
  }
}


enum GenderType { Male, Female }

class _InputPageState extends State<InputPage> {
  GenderType genderSelected;
  int  selectedHeight=180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    print(selectedHeight);
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.change_history,
            ),
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context)=>ConvertorPage(),
              ),
              );
            },
          )
        ],

      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: MainButtons(
                  onpress: () {
                    setState(() {
                      genderSelected = GenderType.Male;
                    });
                  },
                  colour: genderSelected == GenderType.Male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: MainLogos(
                    youricon: FontAwesomeIcons.mars,
                    gender: "MALE",
                  ),
                ),
              ),
              Expanded(
                child: MainButtons(
                  onpress: () {
                    setState(() {
                      genderSelected = GenderType.Female;
                    });
                  },
                  colour: genderSelected == GenderType.Female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: MainLogos(
                    youricon: FontAwesomeIcons.venus,
                    gender: 'FEMALE',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: MainButtons(
              colour: kInactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        globals.myHeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SliderTheme( 
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x1FEB1555),
                      ),
                      child: Slider(
                        value: globals.myHeight.toDouble(),
                        max: 250.0,
                        min: 100.0,
                        // activeColor: Colors.white,
                        //  inactiveColor: Colors.grey,
                        onChanged: (double newValue) {
                          setState(() {
                            globals.myHeight = newValue.round();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MainButtons(
                    colour: kInactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'kg',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row( 
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                Icondata: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                Icondata: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MainButtons(
                    colour: kInactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                Icondata: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                Icondata: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              BmiBrain bmi = BmiBrain(height: globals.myHeight, weight: this.weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    calculation: bmi.GetBmi(),
                    bmiResult: bmi.Getresult(),
                    interpretation: bmi.GetInterpretation(),
                  ),
                ),
              );
            },
            title: 'CALCULATE YOUR BMI',
          ),
        ],
      ),
    );
  }

}
