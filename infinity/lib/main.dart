import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Infinity Express',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pass1 = TextEditingController();
  TextEditingController email1 = TextEditingController();

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
                          // key: _formKey,
                          child: Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  MyTextField(textController: email1, icon: Icons.email,),
                                  SizedBox(height: 25),
                                  MyTextField(textController: pass1, icon: Icons.remove_red_eye,),
                                  SizedBox(height: 2),
                                ],
                              )),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              Button(textName: 'Sign In',),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Don't have an account?"
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

class MyTextField extends StatelessWidget {
  final TextEditingController textController;
  final IconData icon;

  MyTextField({
    required this.textController, required this.icon});



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        hintText: 'Enter your password',
        hintStyle: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50)
        ),
        errorBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(5)),
        floatingLabelBehavior:
        FloatingLabelBehavior.auto,
        //labelText: 'Password',
      ),
    );
  }
}

class Button extends StatefulWidget {
  final String textName;
  Button({required this.textName});


  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red[800],
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          //Navigator.pop(context);
        },
        child: Container(
          height: 83,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius:
              BorderRadius.circular(50)),
          width: double.infinity,
          child: Center(
            child: Text(
              widget.textName,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 19, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
