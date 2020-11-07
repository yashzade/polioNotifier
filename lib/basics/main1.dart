/*import 'package:flutter/material.dart';
import 'package:flutter_app/basics/quiz.dart';
import 'package:flutter_app/basics/scores.dart';

void main() {
  runApp(MyApp());
}

//firebase

//firebase

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  var counter = 0;
  int totalScore = 0;
  List questionsList = [
    {
      'question': 'what is ur Favorite color?',
      'answers': [
        {'Text': 'green', 'score': 10},
        {'Text': 'black', 'score': 5},
        {'Text': 'red', 'score': 4},
        {'Text': 'blue', 'score': 2},
      ]
    },
    {
      'question': 'what is ur Favorite animal?',
      'answers': [
        {'Text': 'Horse', 'score': 5},
        {'Text': 'cat', 'score': 3},
        {'Text': 'dog ', 'score': 3},
        {'Text': 'tiger', 'score': 1},
      ]
    },
  ];

  void pressed(int score) {
    counter += 1;
    totalScore += score;
    setState(() {});
  }

  void reset() {
    setState(() {
      counter = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'App Bar',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          backgroundColor: Colors.black,
        ),
        body: counter < questionsList.length
            ? Quiz(counter, pressed, questionsList)
            : Scores(totalScore, reset),
      ),
    );
  }
}
*/
