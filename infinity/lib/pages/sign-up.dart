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
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        //physics: BouncingScrollPhysics(),
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
                              '''Welcome to your biggest campus transport service ''',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Form(
                            // key: _formKey,
                            child: Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    MyTextField(
                                      textController: name,
                                      icon: Icons.person,
                                      name: 'Enter your full name',
                                      obscure: false,
                                      keyboardType: TextInputType.text,
                                    ),
                                    SizedBox(height: 25),
                                    MyTextField(
                                      textController: email,
                                      icon: Icons.email,
                                      name: 'Enter your e-mail',
                                      obscure: false,
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    SizedBox(height: 25),
                                    MyTextField(
                                      textController: phone,
                                      icon: Icons.phone,
                                      name: 'Enter your phone number',
                                      obscure: false,
                                      keyboardType: TextInputType.phone,
                                    ),
                                    SizedBox(height: 25),
                                    MyTextField(
                                      textController: pass,
                                      icon: Icons.lock,
                                      name: 'Enter your password',
                                      obscure: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                    SizedBox(height: 25),
                                  ],
                                )),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Button(
                                  textName: 'Register',
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account?",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/signIn');
                                        },
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        )),
                                  ],
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
      ),
    );
  }
}
