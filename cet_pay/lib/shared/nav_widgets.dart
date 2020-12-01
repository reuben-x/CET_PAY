import 'dart:ui';
import 'package:cet_pay/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cet_pay/shared/database.dart';
import 'package:provider/provider.dart';

//Landing Page : Home Section

class LandingHome extends StatefulWidget {
  @override
  _LandingHomeState createState() => _LandingHomeState();
}

class _LandingHomeState extends State<LandingHome> {



  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Hey nibba",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(height: 40,),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text(
                  "Payment Status",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                subtitle: Text("Hostel Fees Paid"),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
//////////////////////////////////////////////////////

//Landing Page - Payment Section

class LandingPayments extends StatefulWidget {
  @override
  _LandingPaymentsState createState() => _LandingPaymentsState();
}

class _LandingPaymentsState extends State<LandingPayments> {
  void _previousTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Text(
            "Previous transactions will show up here !!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 20,
            ),
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Text(
                  'Payments Page',
                  style: TextStyle(fontSize: 28),
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                child: IconButton(
                  icon: Icon(Icons.history),
                  color: Colors.green,
                  iconSize: 40,
                  onPressed: () => _previousTransaction(context),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////

//Landing Page - Profile Section

class LandingProfile extends StatefulWidget {
  @override
  _LandingProfileState createState() => _LandingProfileState();
}

class _LandingProfileState extends State<LandingProfile> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value:DatabaseService().users,
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
            SizedBox(height: 450),
            FlatButton.icon(
              color: Colors.green,
              icon: Icon(Icons.person,color: Colors.white,),
              onPressed: () async {
                await _auth.signOut();
                print("Signed Out Successfully");
              },
              label: Text('Log Out',style: TextStyle(
                color: Colors.white,
              ),),
            )
          ],
        ),
      ),
    );
  }
}
