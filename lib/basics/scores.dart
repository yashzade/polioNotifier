import 'package:flutter/material.dart';

class Scores extends StatelessWidget {
  final int score;
  final Function resetfun;
  Scores(this.score, this.resetfun);
  String get getscore {
    print('in get score');
    if (score <= 5) {
      return 'You are Awesome (' + score.toString() + ')';
    } else {
      return 'Need to Hard Work (' + score.toString() + ')';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            getscore + '\nThis is Last Page',
            style: TextStyle(fontSize: 30),
          ),
          RaisedButton(
            child: Text('Retake the Test'),
            onPressed: resetfun,
          ),
        ],
      ),
    );
  }
}
