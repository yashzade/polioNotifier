import 'package:flutter/material.dart';
import 'package:flutter_app/screens/table_calendar.dart';

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table Calendar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Table Calendar Demo'),
    );
  }
}
