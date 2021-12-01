import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinity/pages/home.dart';
import 'package:infinity/pages/sign-up.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  bool loading = false;

  //textfield states
  String phoneNumber = '';

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
                  //Textfield for Phone Number
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
                      validator: (value) =>
                      value!.isEmpty ? 'Enter Phone Number' : null,
                      onChanged: (value) {
                        setState(() => phoneNumber = value);
                      },
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
                        onPressed: ()  {
                          final phone = _phoneController.text.trim();

                          loginUser(phone, context);
                          
                        }),
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
Future<bool> loginUser(String phone, BuildContext context) async{
    FirebaseAuth _auth = FirebaseAuth.instance;

     throw { _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId){} ,
        verificationCompleted: (AuthCredential credential) async{
          Navigator.of(context).pop();

          UserCredential result = await _auth.signInWithCredential(credential);

          User? user = result.user;

          if(user != null){
            Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
          (Route<dynamic> route) => false);
          }else{
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (FirebaseAuthException exception){
          print(exception);
        },
        codeSent: (String verificationId, [int? forceResendingToken]){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text("Get the code?"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _codeController,
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text("Confirm",
                    style: TextStyle(color: Colors.red,)),
                    onPressed: () async{
                      final code = _codeController.text.trim();
                      AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);

                      UserCredential result = await _auth.signInWithCredential(credential);

                      User? user = result.user;

                      if(user != null){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Home()
                        ));
                      }else{
                        print("Error");
                      }
                    },
                  )
                ],
              );
            }
          );
        },
    )};
 }}
  

 
