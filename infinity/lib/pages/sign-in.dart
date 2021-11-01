import 'package:flutter/material.dart';
import 'package:infinity/styles/styles.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController pass1 = TextEditingController();
  TextEditingController phone1 = TextEditingController();

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
                              'INFINITY EXPRESS',
                              style: TextStyle(
                                  fontSize: 43,
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
                                      textController: phone1,
                                      icon: Icons.phone,
                                      name: 'Enter your phone number',
                                      obscure: false,
                                    ),
                                    SizedBox(height: 25),
                                    MyTextField(
                                      textController: pass1,
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
                                  textName: 'Sign In',
                                  onPress: (){},
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account?",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Sign Up',
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
                                Column(
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
                                )
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
