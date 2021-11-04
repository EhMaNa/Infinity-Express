import 'package:flutter/material.dart';
import 'package:infinity/pages/sign-in.dart';
import 'package:infinity/pages/sign-up.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Infinity Express',
        initialRoute: '/',
        routes: {
          '/': (context) => SignUp(),
          '/signIn': (context) => SignIn(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        );
  }
}






