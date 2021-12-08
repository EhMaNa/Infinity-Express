import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:infinity/pages/home.dart';
import 'package:infinity/pages/sign-in.dart';
import 'package:infinity/pages/sign-up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configLoading();

  runApp(MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 1)
    ..indicatorType = EasyLoadingIndicatorType.hourGlass
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 55.0
    ..radius = 15.0
    ..progressColor = Colors.red
    ..backgroundColor = Colors.grey
    ..indicatorColor = Colors.red
    ..textColor = Colors.yellow
    ..maskColor = Colors.white.withOpacity(0.0)
    ..userInteractions = true
    ..animationDuration = const Duration(seconds: 1)
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Infinity Express',
      builder: EasyLoading.init(),
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
