import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final questions;
  Questions(this.questions);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 450, right: 450, top: 100),
      color: Colors.lightGreen,
      child: Text(
        questions,
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
