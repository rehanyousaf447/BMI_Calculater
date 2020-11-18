import 'package:flutter/material.dart';
import 'constants.dart';
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.Icondata, this.onpress});
  final IconData Icondata;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(Icondata),
      onPressed: onpress,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      fillColor: kActiveCardColour,
      shape: CircleBorder(),
    );
  }
}
