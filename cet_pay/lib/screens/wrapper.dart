import 'package:cet_pay/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cet_pay/models/user.dart';
import 'package:cet_pay/screens/home/landing.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserProfile>(context);
    // return either the Home or Authenticate widget
    if(user == null)
      {
        return Authenticate();
      }
    else {
      return Landing();
    }

  }
}