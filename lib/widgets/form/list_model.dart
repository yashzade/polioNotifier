import 'package:flutter/material.dart';

class ListModel extends StatelessWidget {
  final schoolName;
  ListModel(this.schoolName);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    'School Name',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 270,
                    child: Text(
                      schoolName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
