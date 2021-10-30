import 'package:flutter/material.dart';
import 'package:infinity/styles/styles.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController pass = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                              'Welcome to your biggest transport service',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Form(
                            // key: _formKey,
                            child: Expanded(
                                flex: 6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    MyTextField(
                                      textController: name,
                                      icon: Icons.person,
                                      name: 'Enter your full name',
                                      obscure: false,
                                    ),
                                    SizedBox(height: 25),
                                    MyTextField(
                                      textController: email,
                                      icon: Icons.email,
                                      name: 'Enter your e-mail',
                                      obscure: false,
                                    ),
                                    SizedBox(height: 25),
                                    MyTextField(
                                      textController: phone,
                                      icon: Icons.phone,
                                      name: 'Enter your phone number',
                                      obscure: false,
                                    ),
                                    SizedBox(height: 25),
                                    MyTextField(
                                      textController: pass,
                                      icon: Icons.lock,
                                      name: 'Enter your password',
                                      obscure: true,
                                    ),
                                    SizedBox(height: 2),
                                  ],
                                )),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                Button(
                                  textName: 'Register',
                                  onPress: (){},
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account?",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                /*Column(
                                  children: [
                                    Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                )*/
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
      ),
    );
  }
}
