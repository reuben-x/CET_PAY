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
        backgroundColor: Colors.black54,
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
                  child: Text("Welcome $profileName",
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title : Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title : Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
             title : Text('School'),
          ),
        ],
       // currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
       // onTap: _onItemTapped,
      ),
    );
  }
}
