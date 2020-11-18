import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:cet_pay/services/auth.dart';

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
        SizedBox(height: 20),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 30, 40),
              // child: Text("$profileName",
              child: Text(
                "profileName",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: 40,
                //backgroundImage: NetworkImage(profilepicURL),
              ),
            ),
          ],
        ),
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
                    color: Colors.amber,
                    iconSize: 40,
                    onPressed: () => _previousTransaction(context),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////

//Landing Page - Settings Section

class LandingSettings extends StatefulWidget {
  @override
  _LandingSettingsState createState() => _LandingSettingsState();
}

class _LandingSettingsState extends State<LandingSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  'Settings Page',
                  style: TextStyle(fontSize: 28),
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
