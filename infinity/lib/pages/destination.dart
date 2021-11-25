import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinity/pages/booking.dart';
import 'package:select_form_field/select_form_field.dart';

class Destination extends StatefulWidget {
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  //TextEditingController _phoneController = TextEditingController();
  TextEditingController _location = TextEditingController();

  final List<Map<String, dynamic>> _locations = [
    {
      'value': 'Kumasi',
      'label': 'Kumasi',
    },
    
    {
      'value': 'Sunyani',
      'label': 'Sunyani',
    },
  ];
  final List<Map<String, dynamic>> _pickup = [
    {
      'value': 'Diaspora',
      'label': 'Diaspora',
    },

    {
      'value': 'Athletic Oval',
      'label': 'Athletic Oval',
    },
  ];
  final List<Map<String, dynamic>> value = [
    {
      'value': 'Yes',
      'label': 'Yes',
    },
    
    {
      'value': 'No',
      'label': 'No',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      actions: [
        TextButton(onPressed: () =>Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Booking())), child: Text("Next", style: TextStyle(color: Colors.red, fontSize: 20),))
      ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20)),
          SvgPicture.asset(
            'assets/destination.svg',
            height: 250,
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SelectFormField(
                      type: SelectFormFieldType.dropdown, // or can be dialog
                      icon: Icon(Icons.place),
                      labelText: 'Select Pickup Point',
                      items: _pickup,
                      onChanged: (val) => print(val),
                      onSaved: (val) => print(val),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SelectFormField(
                      type: SelectFormFieldType.dialog, // or can be dialog
                      //initialValue: 'Kumasi',
                      icon: Icon(Icons.place),
                      labelText: 'Choose Destination',
                      items: _locations,
                      onChanged: (val) => print(val),
                      onSaved: (val) => print(val),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //TextField for password
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: SelectFormField(
                      type: SelectFormFieldType.dropdown, // or can be dialog
                      //initialValue: 'Kumasi',
                      icon: Icon(Icons.no_luggage_outlined),
                      labelText: 'Do you have lagguage?',
                      items: value,
                      onChanged: (val) => print(val),
                      onSaved: (val) => print(val),
                    ),
                  ),
                  SizedBox(height:20 ,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_view_month_rounded),
                        hintText: 'Departure Date',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        focusColor: Colors.red,
                      ),
                      obscureText: false,
                      controller: _location,
                    ),
                  ),
                  SizedBox(height: 30),

                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
