
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/accessibility.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/get_help_with_safetyissue.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/give_feedback.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/help_center.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/learn_about_hosting.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/list_your_space.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/login_and_security.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/notifications.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/personal_info.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/privacy_sharing.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/report_a_concern.dart';
import 'package:pardillo_finalproject/direction_to_pages/profile_pages/resort.dart';


void main()=>runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Profile(),
    )
);
void signUserOut(){
  FirebaseAuth.instance.signOut();
}

class Profile extends StatefulWidget {
  const Profile({super.key});


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final textStyleState = const TextStyle(
      fontSize: 11.0,
      color: Colors.white
  );

  final textStyleTop = const TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );

  final textStyle2 = const TextStyle(
      color: Colors.white

  );

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
          Padding(
            padding:  const EdgeInsets.all(15),
            child: Text("Account settings".toUpperCase(),
              style: const TextStyle(color: Colors.grey,fontSize: 15,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const PersonalInfo()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Personal informations",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.person,
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
                MaterialPageRoute(builder: (context) => const LoginAndSecurity()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Login & security",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.security,
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
                MaterialPageRoute(builder: (context) => const Notifications()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Notification",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.notifications,
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
                MaterialPageRoute(builder: (context) => const Accessibility()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Accessibility",
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
                MaterialPageRoute(builder: (context) => const PrivacyNSharing()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Privacy and sharing",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.privacy_tip,
                  ),
                ],
              ),
            ),
          ),


          Padding(
            padding:  const EdgeInsets.all(15),
            child: Text("Hosting".toUpperCase(),style: const TextStyle(color: Colors.grey,fontSize: 15,),),
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
                MaterialPageRoute(builder: (context) => const Resort()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Resort",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.beach_access,
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
                MaterialPageRoute(builder: (context) => const ListYourSpace()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "List your space",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.space_dashboard,
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
                MaterialPageRoute(builder: (context) => const LearnAboutHosting()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Learn about hosting",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.house_outlined,
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding:  const EdgeInsets.all(15),
            child: Text("Support".toUpperCase(),style: const TextStyle(color: Colors.grey,fontSize: 15,),),
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
                MaterialPageRoute(builder: (context) => const GetHelpWithSafetyIssue()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Get help with a safety issue",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.safety_check,
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
                MaterialPageRoute(builder: (context) => const HelpCenter()),
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
                    Icons.feed,
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
                MaterialPageRoute(builder: (context) => const ReportConcern()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Report a concern",
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.report,
                  ),
                ],
              ),
            ),
          ),


          Padding(
            padding:  const EdgeInsets.all(15),
            child: Text("Log out".toUpperCase(),style: const TextStyle(color: Colors.grey,fontSize: 15,),),
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
              FirebaseAuth.instance.signOut();
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      "Sign out",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.redAccent, // Consider using the same color as the text for consistency
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
          const Padding(
            padding:  EdgeInsets.all(15),
            child: Text("Version 12.19.2023",
              style: TextStyle(color: Colors.black,fontSize: 12,
              ),
            ),
          ),

        ],
      ),
    );
  }
}