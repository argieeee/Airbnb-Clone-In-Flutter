import 'package:flutter/material.dart';
import 'package:pardillo_finalproject/direction_to_pages/message_pages/notification_page.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/notifications.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Trips(),
  ),
);

class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);

  @override
  _TripsState createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Notifications()),
                    );
                  },
                  icon: const Icon(Icons.notifications),
                ),
                const Text(
                  "Trips",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 50),
              ],
            ),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'No trips booked yet!',
              style: TextStyle(
                fontSize: 20 ,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Time to dust off your bags and start planning your next adventure.',
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality for the button here
                  // For example: Navigator.push...
                },
                child: const Text(
                  'Start searching',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black, // Set text color to black
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
