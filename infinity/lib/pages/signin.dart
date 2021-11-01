import 'package:flutter/material.dart';
import 'package:infinity/widgets/button.dart';
import 'package:infinity/widgets/textfield.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            'INFINITY EXPRESS',
                            style: TextStyle(
                                fontSize: 43,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Form(
                          //key: _formKey,
                          child: Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  MyTextField(textController: phone, icon: Icons.phone, hintText: 'Phone Number',),
                                  SizedBox(height: 25),
                                  MyTextField(textController: password, icon: Icons.security, hintText: 'Password',),
                                  SizedBox(height: 2),
                                ],
                              )),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              Button(label: 'Sign In',),
                              SizedBox(
                                height: 20,
                              ),
                              //Button(textName: 'Cancel',)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}