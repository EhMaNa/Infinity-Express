import 'package:flutter/material.dart';

class Tickets extends StatefulWidget {
  const Tickets({ Key? key }) : super(key: key);

  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'No tickets available',
          style: TextStyle(color: Colors.red),
        ),
      ),
      
    );
  }
}