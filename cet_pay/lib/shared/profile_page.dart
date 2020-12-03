import 'dart:math';
import 'dart:ui';
import 'package:cet_pay/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cet_pay/shared/database.dart';
import 'package:provider/provider.dart';
import 'package:cet_pay/dark_mode/provider.dart';

class LandingProfile extends StatefulWidget {
  @override
  _LandingProfileState createState() => _LandingProfileState();
}

class _LandingProfileState extends State<LandingProfile> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().users,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      'Profile Page',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            FlatButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () async {
                await _auth.signOut();
                print("Signed Out Successfully");
              },
              label: Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Checkbox(
                value: themeChange.darkTheme,
                onChanged: (bool value) {
                  themeChange.darkTheme = value;
                }),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
