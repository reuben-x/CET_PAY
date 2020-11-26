import 'package:cet_pay/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cet_pay/shared/nav_widgets.dart';
class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();


}

class _LandingState extends State<Landing> {

  int _currentIndex = 0;
  PageController _pageController = PageController();

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CET Pay'),
        backgroundColor: Colors.black54,
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            onPressed: () async {
              await _auth.signOut();
            },
            label: Text('Log Out'),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page){
          setState(() {
            _currentIndex = page;
          });
        },
        children: <Widget>[
          LandingHome(),
          LandingPayments(),
          LandingSettings(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.black ,),
            title : Text('Home',style: TextStyle(color: Colors.black),),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.euro_symbol,color: Colors.black),
             title : Text('Payments',style: TextStyle(color: Colors.black),),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: Colors.black),
            title : Text('Settings',style: TextStyle(color: Colors.black),),
          ),
        ],
       onTap: (index) {
          setState(() {
              _currentIndex= index;
              _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.decelerate);
              
          });
       },
       // currentIndex: _selectedIndex,
       // onTap: _onItemTapped,
      ),
    );
  }
}
