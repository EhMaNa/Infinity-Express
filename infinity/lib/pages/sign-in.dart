import 'package:flutter/material.dart';
import 'package:infinity/styles/styles.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

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
                                      textController: phone,
                                      icon: Icons.phone,
                                      name: 'Enter your phone number',
                                      obscure: false,
                                      keyboardType: TextInputType.phone,
                                    ),
                                    SizedBox(height: 25),
                                    MyTextField(
                                      textController: password,
                                      icon: Icons.lock,
                                      name: 'Enter your password',
                                      obscure: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
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
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account?",
                                        style: TextStyle(fontSize: 18)),
                                    BlueText(textName: 'Sign Up',onTap: () {
                                      Navigator.pushNamed(
                                          context, '/');
                                    },),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
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
