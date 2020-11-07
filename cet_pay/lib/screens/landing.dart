import 'package:cet_pay/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cet_pay/screens/signin.dart';
class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overview'),
        backgroundColor: Colors.grey,
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            onPressed: () async {
              authService.signOut();
              Navigator.of(context).pushReplacement(
              MaterialPageRoute(
              builder: (context) {
              return SignIn();
                },
              ),
            );
            },
            label: Text('Log Out'),
          )
        ],
      ),
      body: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 30, 40),
                  child: Text("Welcome Kevin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),),
                ),
                SizedBox(width: 40,),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://picsum.photos/200'),
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
      ),
    );
  }
}
