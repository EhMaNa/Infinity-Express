import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textController;
  final IconData icon;
  final String hintText;

  MyTextField({required this.textController, required this.icon, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        //labelText: 'Password',
      ),
    );
  }
}
