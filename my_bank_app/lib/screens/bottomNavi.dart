import 'package:flutter/material.dart';
import 'package:my_bank_app/screens/homeveiw.dart';
import 'package:my_bank_app/screens/myCard.dart';
import 'package:my_bank_app/screens/transcationpage.dart';


class MyBottomNavigator extends StatefulWidget {
  const MyBottomNavigator({super.key});

  @override
  State<MyBottomNavigator> createState() => _MyBottomNavigatorState();
}

class _MyBottomNavigatorState extends State<MyBottomNavigator> {
 int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    
    
   MyCardsPage(),
   TranscationPage()

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      
    });
  }




  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_outlined),
            label: 'My cards',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: '')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );

  
  }
}









