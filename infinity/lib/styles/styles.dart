import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String textName;
  Button({required this.textName});


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
          //Navigator.pop(context);
        },
        child: Container(
          height: 83,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius:
              BorderRadius.circular(20)),
          width: double.infinity,
          child: Center(
            child: Text(
              widget.textName,
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

class MyTextField extends StatelessWidget {
  final String name;
  final TextEditingController textController;
  final IconData icon;
  final bool obscure;

  MyTextField({required this.name,required this.obscure,
    required this.textController, required this.icon});



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        hintText: name,
        hintStyle: TextStyle(
            fontSize: 19,
            color: Colors.black
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50)
        ),
        errorBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(5)),
        floatingLabelBehavior:
        FloatingLabelBehavior.auto,
        //labelText: 'Password',
      ),
    );
  }
}
