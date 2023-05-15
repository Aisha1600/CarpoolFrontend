import 'package:carpoolfront/find_your_carpool.dart';
import 'package:carpoolfront/offer_carpool.dart';
import 'package:carpoolfront/post_offer.dart';
import 'package:carpoolfront/select_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Select_Role(),
    OfferCarpool(),
    FindYourCarpool()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_right),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_sharp),
            label: 'Avail',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
