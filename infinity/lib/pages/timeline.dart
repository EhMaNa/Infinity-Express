import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  @override
  _Timeline createState() => _Timeline();
}

class _Timeline extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/infinity1.jpg', ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
