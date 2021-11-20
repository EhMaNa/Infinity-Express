import 'package:flutter/material.dart';
import 'package:infinity/pages/home.dart';
import 'package:infinity/pages/sign-in.dart';
import 'package:infinity/pages/sign-up.dart';


void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Infinity Express',
        initialRoute: '/',
        routes: {
          '/': (context) => SignIn(),
          '/signUP': (context) => SignUp(),
          '/home': (context) => Home(),

        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        );
        
  }
}






