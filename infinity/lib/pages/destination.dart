import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinity/authentication/auththentication.dart';
import 'package:infinity/database/database.dart';
import 'package:infinity/models/student.dart';
import 'package:infinity/models/ticket.dart';
import 'package:infinity/pages/booking.dart';
import 'package:infinity/pages/home.dart';
import 'package:select_form_field/select_form_field.dart';

class Destination extends StatefulWidget {
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  Person person = Person();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final String currentUserID = Authentication().getCurrentUserID;
  //TextEditingController _phoneController = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController _seat = TextEditingController();
  String destination = '';
  String seatNumber = '';
  String pickUp = '';
  String departure = '';
  String randomID = '';
  String lagguage = '';

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
  void initState() {
    super.initState();
    randomID = FirebaseFirestore.instance.collection('posts').doc().id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Provide Details',
            style: TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.w800)),
        actions: [
          TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  String check = await uploadPost();

                  check != null
                      ? EasyLoading.showSuccess('Seat Booked',
                          dismissOnTap: true)
                      : EasyLoading.showError('Cannot Book Seat',
                          dismissOnTap: true);
                } else {
                  EasyLoading.showError('Select file and Choose #Tag',
                      duration: Duration(seconds: 2));
                }
              },
              child: Text(
                "Next",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ))
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20, bottom: 100)),
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
                      icon: Icon(Icons.location_on_outlined),
                      labelText: 'Select Pickup Point',
                      items: _pickup,
                      onChanged: (value) {
                        setState(() => pickUp = value);
                      },
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
                      icon: Icon(Icons.location_city_outlined),
                      labelText: 'Choose Destination',
                      items: _locations,
                      onChanged: (value) {
                        setState(() => destination = value);
                      },
                      onSaved: (val) => print(val),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //TextField for password

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SelectFormField(
                      type: SelectFormFieldType.dropdown, // or can be dialog
                      //initialValue: 'Kumasi',
                      icon: Icon(Icons.luggage_outlined),
                      labelText: 'Do you have lagguage?',
                      items: value,

                      onSaved: (val) => print(val),
                      onChanged: (value) {
                        setState(() => lagguage = value);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Seat Number',
                        prefixIcon: Icon(Icons.chair),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        focusColor: Colors.red,
                      ),
                      obscureText: false,
                      controller: _seat,
                      onChanged: (value) {
                        setState(() => seatNumber = value);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Departure Date',
                        prefixIcon: Icon(Icons.date_range_outlined),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        focusColor: Colors.red,
                      ),
                      obscureText: false,
                      controller: date,
                      onChanged: (value) {
                        setState(() => departure = value);
                      },
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future uploadPost() async {
    if (destination.isNotEmpty && departure.isNotEmpty ||
        pickUp.isNotEmpty && _formKey.currentState!.validate()) {
      EasyLoading.show(
          status: 'Creating  Ticket',
          maskType: EasyLoadingMaskType.custom,
          dismissOnTap: false);

      // then upload document to firestore
      Ticket ticket = Ticket(
        destination: destination,
        seatNumber: seatNumber,
        lagguage: lagguage,
        departure: departure,
        ticketID: randomID,
        pickUp: pickUp,
        name: person.name,
      );

      
      await FirestoreService.ticketsCollection
          .doc(currentUserID)
          .collection('tickets')
          .doc(ticket.ticketID)
          .set({
        'destination': ticket.destination,
        'seatNUmber': ticket.seatNumber,
        'depature': ticket.departure,
        'name': person.name,
        'tickeID': randomID
      });
      EasyLoading.showToast('Upload Done');
      EasyLoading.dismiss();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      EasyLoading.showToast('Cannot Upload Post, Choose #Tag');
    }
  }
}
