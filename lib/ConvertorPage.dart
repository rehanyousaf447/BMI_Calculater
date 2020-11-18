import 'package:flutter/material.dart';
import 'MainButtons.dart';
import 'constants.dart';
import 'Bottom_button.dart';
import 'package:bmi_calculator/Input_page.dart';
import 'package:bmi_calculator/Globals.dart' as globals;
import 'package:rflutter_alert/rflutter_alert.dart';
class ConvertorPage extends StatefulWidget {
  @override
  _ConvertorPageState createState() => _ConvertorPageState();
}
enum Myunit { feet, meter,inch }

class _ConvertorPageState extends State<ConvertorPage> {
  String unit="feet";
  Myunit _unitSelected=Myunit.feet;
  double selectedHeight;


  void convertingintocm(){
    if(_unitSelected==Myunit.meter){
      selectedHeight=selectedHeight*100;
    }
    else if(_unitSelected==Myunit.feet){
      selectedHeight=selectedHeight*30.48;

    }
    else{
      selectedHeight=selectedHeight*2.54;
    }
    globals.myHeight=(selectedHeight).round();

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CONVERTOR',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Enter Your Height in $unit',
            style: TextStyle(
              fontSize: 30.0,
            ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: MainButtons(
                colour: kActiveCardColour,
                cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text(
                         'Feet',
                         style: kBodyTextStyle,
                       ),
                       Radio(
                         activeColor: Colors.grey,
                         value: Myunit.feet,
                         groupValue: _unitSelected,
                         onChanged: (Myunit value) {
                           setState(() {
                             _unitSelected= value;
                             unit="feet";
                           });
                         },


                       ),
                       Text(
                           'Meter',
                         style: kBodyTextStyle,
                       ),
                       Radio(
                         activeColor: Colors.grey,
                         value: Myunit.meter,
                         groupValue: _unitSelected,
                         onChanged: (Myunit value) {
                           setState(() {
                             _unitSelected= value;
                             unit="meter";
                           });
                         },
                       ),
                       Text(
                           'Inch',
                         style: kBodyTextStyle,
                       ),
                       Radio(
                         activeColor: Colors.grey,
                         value: Myunit.inch,
                         groupValue: _unitSelected,
                         onChanged: (Myunit value) {
                           setState(() {
                             _unitSelected= value;
                             unit='Inch';
                           });
                         },
                       ),
                     ],
                   ),
                   Container(
                     width: 300,
                     height: 50,
                     color: kInactiveCardColour,
                     child: TextField(
                       decoration: InputDecoration(
                           border: InputBorder.none,
                           hintText: 'Enter Your Height in $unit',
                           fillColor: Colors.black
                       ),
                       onSubmitted: (String text) {
                         selectedHeight=double.parse(text);
                         print(selectedHeight);
                       },
                       onChanged: (String text){
                         this.selectedHeight=double.parse(text);
                         print(selectedHeight);
                       },

                     ),
                   )
                  ],
                ),
              ),
            ),
            BottomButton(
              onTap: (){
                convertingintocm();
                if(globals.myHeight>250) {
//                  Alert(
//                      context: context,
//                      title: "WARNING",
//                      desc: "Sorry Tallest man in the world is 243 cm, You're not the tallest man So Convert your real height.")
//                      .show();
                  globals.myHeight=249;
                }
                if(globals.myHeight<100){
                  globals.myHeight=100;
                }
                Navigator.pop(context);
              },
              title: 'CONVERT',
            )
          ],
        ),
      ),
    );
  }
}
