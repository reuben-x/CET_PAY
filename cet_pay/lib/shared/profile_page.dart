import 'package:settings_ui/settings_ui.dart';
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
     child: SettingsList(

       sections: [
         SettingsSection(
           title: 'Profile Details',
           tiles: [
             SettingsTile(
               title: 'College Mail ID',
               trailing: Text('kevinmt@cet.ac.in'),
             ),
             SettingsTile(
               title: 'Admission Number',
               trailing: Text('180004'),
             ),
             SettingsTile(
               title: 'Roll Number',
               trailing: Text('TVE18CS028'),
             ),
             SettingsTile(
               title: 'Year of Admission',
               trailing: Text('2018'),
             ),

           ],
         ),
         SettingsSection(
           title: 'Settings',
           tiles : [
             SettingsTile.switchTile(
               title: 'Enable Notifications',
               leading : Icon(Icons.notifications_active),
               switchValue: false,
               onToggle: (value) {},
               switchActiveColor: Colors.green,
             ),
             SettingsTile.switchTile(
               title: 'Dark Mode',
               leading : Icon(Icons.lightbulb_outline),
               switchValue: themeChange.darkTheme,
               onToggle: (value) {
                 themeChange.darkTheme = value;
               },
               switchActiveColor: Colors.green,
             ),
           ],
         ),
         SettingsSection(
           title: 'About',
           tiles: [
             SettingsTile(
               title: 'View Licenses',
               leading: Icon(Icons.extension),
               onTap: () {
                 return showDialog<void>(
                   context: context,
                   barrierDismissible: false, // user must tap button!
                   builder: (BuildContext context) {
                     return AlertDialog(
                       title: Text('Licenses'),
                       content: SingleChildScrollView(
                         child: ListBody(
                           children: <Widget>[
                             Text('Designed by Project X Team.'),
                             SizedBox(height: 5),
                             Text('Application developed using Flutter and Firebase.',style: TextStyle(fontSize: 15),),
                           ],
                         ),
                       ),
                       actions: <Widget>[
                         FlatButton(
                           child: Text('Close'),
                           onPressed: () {
                             Navigator.of(context).pop();
                           },
                         ),
                       ],
                     );
                   },
                 );
               },
             ),
             SettingsTile(
               title: 'Sign Out',
               leading: Icon(Icons.exit_to_app),
               onTap: () async{
                 await _auth.signOut();
               },
             ),
           ],
         ),
       ],
     )
    );
  }
}





// Checkbox(
// value: themeChange.darkTheme,
// onChanged: (bool value) {
// themeChange.darkTheme = value;
// }),