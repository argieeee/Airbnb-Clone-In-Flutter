import 'package:flutter/material.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/notifications.dart';
import 'package:pardillo_finalproject/subscribe_person_pages/subscribe_page/promote_resort.dart';

class Today extends StatefulWidget {
  const Today({Key? key}) : super(key: key);

  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  int _selectedIndex = 0; // Index for selected button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Today",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications), // Notification icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Notifications()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Welcome, ${getCurrentUserName()}!', // Assuming you have a method to get the user's name
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PromoteResort()),
                );
              },
              child: const Text('Complete your listing'),
            ),
            const SizedBox(height: 40),
            const Text(
              'Your reservation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0; // Checking out button index
                    });
                    // Add functionality for "Checking out" button
                  },
                  child: const Text('Checking out'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1; // Currently hosting button index
                    });
                    // Add functionality for "Currently hosting" button
                  },
                  child: const Text('Currently hosting'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 5,
                  width: 150,
                  decoration: BoxDecoration(
                    color: _selectedIndex == 0 ? Colors.blue : Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  height: 5,
                  width: 150,
                  decoration: BoxDecoration(
                    color: _selectedIndex == 1 ? Colors.blue : Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String getCurrentUserName() {
    // Method to get the current user's name
    return 'User'; // Replace with actual logic to retrieve the user's name
  }
}