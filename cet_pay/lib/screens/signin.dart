import 'package:cet_pay/screens/landing.dart';
import 'package:cet_pay/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cet_pay/shared/loading.dart';

bool isLoading = true;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => new _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CetPay"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(height: 100,),
          Center(child: Image.asset("assets/images/cetlogo.jpg")),
          SizedBox(height: 120),
          GestureDetector(
            onTap: () {
               authService.googleSignIn().then((result) {
                if (result != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return Landing();
                      },
                    ),
                  );
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 50),
                child: Text("Sign Up with Google", style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                )),
              )
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Text("Sign in using your CET Mail ID.",
            style : TextStyle(
              fontSize: 15,
            ) )
          ),
        ],
      ),

    );
  }
}