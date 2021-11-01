import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String label;
  Button({required this.label});


  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red[800],
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 83,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius:
              BorderRadius.circular(50)),
          width: double.infinity,
          child: Center(
            child: Text( widget.label,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 19, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}