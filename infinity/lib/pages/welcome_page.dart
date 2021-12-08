import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/signup.svg', height: 180),
            SizedBox(height: 30),
            Text('INFINITY EXPRESS', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
            Column(
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                      child: Container(
                          width: 200,
                          height: 50,
                          child: Center(
                              child: Text('Create Account ',
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
                      onPressed: () async {
                      
                        
                      }),
                ),
                SizedBox(height: 25),
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
                          backgroundColor: Colors.red,
                          primary: Colors.red,
                          side: BorderSide(
                            color: Colors.red,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () async {
                        
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
