import 'package:cet_pay/screens/landing.dart';
import 'package:flutter/material.dart';
import 'screens/signin.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MyHomePage(),
    );
  }
}

