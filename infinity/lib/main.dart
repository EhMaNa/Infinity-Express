import 'package:flutter/material.dart';
import 'package:infinity/pages/sign-in.dart';
import 'package:infinity/pages/signup.dart';


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
        home: SignUp());
  }
}






