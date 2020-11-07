import 'package:cet_pay/screens/landing.dart';
import 'package:cet_pay/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                  Navigator.of(context).push(
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
          )
        ],
      ),

    );
  }
}