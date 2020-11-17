import 'package:flutter/material.dart';
import 'package:cet_pay/services/auth.dart';

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
              child: Text("$profileName",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
            ),
            SizedBox(width: 40,),
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(profilepicURL),
              ),
            ),
          ],
        ),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text("Payment Status",style: TextStyle(
                  fontSize: 22,
                ),),
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

//Landing Page - Services Section

class LandingServices extends StatefulWidget {
  @override
  _LandingServicesState createState() => _LandingServicesState();
}

class _LandingServicesState extends State<LandingServices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(child: Text('Services Page',style: TextStyle(fontSize: 28),)),
      ),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(child: Text('Payments Page',style: TextStyle(fontSize: 28),)),
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(child: Text('Settings Page',style: TextStyle(fontSize: 28),)),
      ),
    );
  }
}

