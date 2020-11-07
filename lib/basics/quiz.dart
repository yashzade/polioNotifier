import 'package:flutter/material.dart';
import 'package:flutter_app/basics/answers.dart';
import 'package:flutter_app/basics/questions.dart';

//Quiz class is proviing the questions and answer
class Quiz extends StatelessWidget {
  final int counter;
  final Function pressed;
  final List questionsList;

  Quiz(this.counter, this.pressed, this.questionsList);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questions(
          // here we call the constructor of question
          questionsList[counter]['question'], //after that build method will run
        ),
        ...questionsList[counter]['answers'].map(
          //here we will call answer button widget
          (ans) => Answers(() => pressed(ans['score']), ans['Text']),
        ),
      ],
    );
  }
}
