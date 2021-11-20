import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinity/pages/sign-in.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  //textfield states
  String email = '';
  String password = '';
  String name = '';
  String confirmPassword = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(physics: BouncingScrollPhysics(), children: <Widget>[
        SvgPicture.asset(
          'assets/wrapper.svg',
          height: 200,
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                //Textfield for name

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    maxLength: 20,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Username*',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    controller: _nameController,
                    /*validator: (value) =>
                        value.isEmpty ? 'UserName field cannot be empty' : null,
                    onChanged: (value) {
                      setState(() => name = value);
                    },*/
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android_outlined),
                      hintText: 'Phone Number*',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    //validator: (value) =>
                    //  value.isEmpty ? 'Enter a valid email' : null,
                    //onChanged: (value) {
                    //  setState(() => email = value);
                    //},
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      hintText: 'Please provide a valid Email*',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    /*  validator: (value) =>
                        value.isEmpty ? 'Enter a valid email' : null,
                    onChanged: (value) {
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
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password*',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    obscureText: true,
                    controller: _passwordcontroller,
                    /*validator: (value) => value.length < 6
                        ? 'Password should contain more than 6 Characters'
                        : null,
                    onChanged: (value) {
                      setState(() => password = value);
                    },*/
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                //textfied for confirming passowrd
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      hintText: 'ConfirmPassword*',
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    obscureText: true,
                    controller: _confirmPasswordController,
                    validator: (value) => value != password
                        ? ' Characters should match Password characters'
                        : null,
                    onChanged: (value) {
                      setState(() => confirmPassword = value);
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    child: Container(
                        width: 200,
                        height: 50,
                        child: Center(
                            child: Text('Sign Up ',
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
                    },
                  ),
                ),

                SizedBox(
                  height: 25,
                ),
                TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn())),
                  child: Text("Already Have an Account? Sign in",
                      style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
