import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class BookWithUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Container(
        width: double.infinity,
        height: 55.0,
        child: DefaultTextStyle(
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 26.0,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 7.0,
                color: Colors.white,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              RotateAnimatedText(
                "Book a seat now",
                textAlign: TextAlign.center,
                 textStyle: TextStyle(fontSize: 30.0, color: Colors.red, fontStyle: FontStyle.italic)
              ),
              RotateAnimatedText(
                "Infinity Transport ",
                textAlign: TextAlign.center,
                textStyle: TextStyle(fontSize: 30.0, color: Colors.red),
              ),
              RotateAnimatedText(
                "'One in a Million'",
                textAlign: TextAlign.center,
                textStyle: TextStyle(fontSize: 30.0, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
