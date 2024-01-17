import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pardillo_finalproject/constant/colors.dart';
import 'package:pardillo_finalproject/subscribe_person_pages/subscribe_page/listing_page.dart';
import 'package:pardillo_finalproject/subscribe_person_pages/subscribe_page/menu_pages/menu_page.dart';
import 'package:pardillo_finalproject/subscribe_person_pages/subscribe_page/today_page.dart';
import 'package:pardillo_finalproject/widgets/select_data_widget.dart';

class SubscribeAccount extends StatefulWidget {
  const SubscribeAccount({Key? key}) : super(key: key);

  @override
  _SubscribeAccountState createState() => _SubscribeAccountState();
}

class _SubscribeAccountState extends State<SubscribeAccount> {
  int _currentTab = 0;
  final List<StatefulWidget> _children = [
    const Today(),
    const Calendar(),
    const Listings(),
    const Menu(),
  ];

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFE7EBEE),
      body: SafeArea(
        child: _children[_currentTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: Constants.greenAirbnb,
        unselectedItemColor: Colors.grey[800],
        type: BottomNavigationBarType.fixed,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        currentIndex: _currentTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.today,
              size: 30,
            ),
            label: 'Today',
            activeIcon: Text(
              "TODAY",
              style: TextStyle(fontSize: 11),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              size: 30,
            ),
            label: 'Calendar',
            activeIcon: Text(
              "CALENDAR",
              style: TextStyle(fontSize: 11),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              size: 30,
            ),
            label: 'Listings',
            activeIcon: Text(
              "LISTINGS",
              style: TextStyle(fontSize: 11),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              size: 30,
            ),
            label: 'Menu',
            activeIcon: Text(
              "MENU",
              style: TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
