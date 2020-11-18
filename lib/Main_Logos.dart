import 'package:flutter/material.dart';
class MainLogos extends StatelessWidget {
  final IconData youricon;
  final String gender;

  MainLogos({this.youricon,this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          youricon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          gender,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Color(0xFF8E8E99),
          ),
        )
      ],
    );
  }
}