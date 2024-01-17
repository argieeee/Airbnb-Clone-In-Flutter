
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pardillo_finalproject/singupPages/homePage.dart';
import 'package:pardillo_finalproject/singupPages/register_or_loginPage.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return const HomePage();
          }
          else{
            return const LoginOrRegister();

          }

        },
      ),
    );
  }
}
