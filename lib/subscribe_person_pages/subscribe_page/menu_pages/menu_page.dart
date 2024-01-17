import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/give_feedback.dart';
import 'package:pardillo_finalproject/singupPages/homePage.dart';
import 'package:pardillo_finalproject/subscribe_person_pages/subscribe_page/menu_pages/connect_with_hosts_nearyou.dart';
import 'package:pardillo_finalproject/subscribe_person_pages/subscribe_page/menu_pages/explore_hosting_resources.dart';
import 'package:pardillo_finalproject/subscribe_person_pages/subscribe_page/menu_pages/help_center_for_menu.dart';
import 'package:pardillo_finalproject/subscribe_person_pages/subscribe_page/menu_pages/safety_issue_for_menu.dart';
import 'package:pardillo_finalproject/subscribe_person_pages/subscribe_page/menu_pages/settings_for_menu.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Menu(),
  ),
);

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 40.0,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(width: 15,),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Profile",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black87
                    ),),
                  ],
                )
              ],
            ),
          ),
          ClipRRect(
            child: Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              decoration: const BoxDecoration(
                color: Colors.black12,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 5.0,
                  ),
                ],
              ),
              width: 50,
              height: 1,
            ),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const Settings()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Settings",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.settings,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            width: 50,
            height: 1,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VisitTheHelpCenter()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Visit the Help Center",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.help_center,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            width: 50,
            height: 1,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GetHelpWithASafetyIssue()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Get help with a Safety issue",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.health_and_safety,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            width: 50,
            height: 1,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExploreHostingResources()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Explore hosting resources",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.explore,
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            width: 50,
            height: 1,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConnectHostsNearYou()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Connect with Hosts near you",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.near_me_sharp,
                  ),
                ],
              ),
            ),
          ),


          const SizedBox(height: 5),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GiveUsFeedback()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Give us feedback",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.feedback,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            width: 50,
            height: 1,
          ),
          // Divider below the last button

          const SizedBox(height: 15),

          const Divider(
            color: Colors.black,
            thickness: 2,
          ),

          const SizedBox(height: 15),

          // "Switch to Traveling" button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text('Switch to Traveling'),
            ),
          ),

          const SizedBox(height: 15),

          // "Log out" button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black45, // Set background color to black
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Log out',
                style: TextStyle(color: Colors.white), // Set text color to white
              ),
            ),
          ),

        ],
      ),
    );
  }
}
