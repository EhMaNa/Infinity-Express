import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  bool loading = false;

  //textfield states
  String email = '';
  String password = '';
  String error = '';
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Kumasi',
      'label': 'Kumasi',
    },
    {
      'value': 'circleValue',
      'label': 'Circle Label',
      'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': 'Sunyani',
      'label': 'Sunyani',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SvgPicture.asset(
            'assets/destination.svg',
            height: 250,
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  //Textfield for email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SelectFormField(
                      type: SelectFormFieldType.dropdown, // or can be dialog
                      //initialValue: 'Kumasi',
                      icon: Icon(Icons.place),
                      labelText: 'Choose Destination',
                      items: _items,
                      onChanged: (val) => print(val),
                      onSaved: (val) => print(val),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //TextField for password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.security),
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

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        child: Container(
                            width: 200,
                            height: 50,
                            child: Center(
                                child: Text('Continue ',
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600)))),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.red,
                            side: BorderSide(
                              color: Colors.red,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
