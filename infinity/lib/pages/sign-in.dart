import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinity/pages/sign-up.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  bool loading = false;

  //textfield states
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SvgPicture.asset(
            'assets/signin.svg',
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android_outlined),
                        hintText: 'Phone Number',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        focusColor: Colors.red,
                      ),
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      //validator: (value) =>
                      //value.isEmpty ? 'Enter a valid email' : null,
                      /*onChanged: (value) {
                        setState(() => email = value);
                      },*/
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
                        hintText: 'Password',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        focusColor: Colors.red,
                      ),
                      obscureText: true,
                      controller: _passwordcontroller,
                      /*validator: (value) =>
                          value.length < 6 ? 'Incorrect password' : null,
                      onChanged: (value) {
                        setState(() => password = value);
                      },*/
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
                                child: Text('Sign In ',
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

                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      
                    },
                    child: Text(
                      "Forgot Password?",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp())),
                    child: Text("Don't Have an Account? SignUp",
                        style: TextStyle(color: Colors.red)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
