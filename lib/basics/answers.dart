import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final Function pressed;
  final String answer;
  Answers(this.pressed, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 500, right: 500),
      width: double.infinity,
      child: RaisedButton(
        colorBrightness: Brightness.light,
        child: Text(answer),
        onPressed: pressed,
        color: Colors.amberAccent,
      ),
    );
  }
}
