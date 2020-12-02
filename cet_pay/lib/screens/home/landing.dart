import 'package:flutter/material.dart';
import 'package:cet_pay/shared/nav_widgets.dart';
class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();


}

class _LandingState extends State<Landing> {

  int _currentIndex = 0;
  PageController _pageController = PageController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          LandingProfile(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        selectedFontSize: 15,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            title : Text('Home'),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.euro_symbol),
             title : Text('Payments'),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title : Text('Profile'),
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
