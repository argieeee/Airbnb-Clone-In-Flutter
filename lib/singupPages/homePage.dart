import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pardillo_finalproject/constant/colors.dart';
import 'package:pardillo_finalproject/pages/favorites.dart';
import 'package:pardillo_finalproject/pages/explore_page.dart';
import 'package:pardillo_finalproject/pages/message_page.dart';
import 'package:pardillo_finalproject/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int _currentTab = 0;
  final List<StatefulWidget> _children = [
    const HomeScreen(),
    const Wishlists(),
    const Trips(),
    const Profile(),
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
              Icons.search,
              size: 30,
            ),
            label: 'Explore',
            activeIcon: Text(
              "EXPLORER",
              style: TextStyle(fontSize: 11),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              size: 30,
            ),
            label: 'Wishlists',
            activeIcon: Text(
              "WISHLISTS",
              style: TextStyle(fontSize: 11),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_in_ar,
              size: 30,
            ),
            label: 'Trips',
            activeIcon: Text(
              "TRIPS",
              style: TextStyle(fontSize: 11),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 30,
            ),
            label: 'Profile',
            activeIcon: Text(
              "PROFILE",
              style: TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}


