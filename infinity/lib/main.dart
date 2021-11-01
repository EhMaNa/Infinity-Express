import 'package:flutter/material.dart';
import 'package:infinity/pages/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Infinity Express',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home());
  }
}






