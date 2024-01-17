
import 'package:flutter/material.dart';
import 'package:pardillo_finalproject/singupPages/loginPage.dart';
import 'package:pardillo_finalproject/singupPages/registerPage.dart';

class LoginOrRegister extends StatefulWidget {
  // void Function()? onTap;
  const LoginOrRegister({super.key,});


  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(
        onTap: togglePages
      );
    }else {
      return RegisterPage(
        onTap: togglePages
      );
    }
  }
}

