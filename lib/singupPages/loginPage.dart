import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pardillo_finalproject/components/my_button.dart';
import 'package:pardillo_finalproject/components/my_textfield.dart';


class LoginPage extends StatefulWidget {

  final void Function()? onTap;

   const  LoginPage({super.key, this.onTap,});

  @override
  State<LoginPage> createState() => _LoginPageState();

}



class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  // sign user in method
  void signUserIn() async {

    showDialog(context: context,
        builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
        },
    );

   try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: emailController.text,
         password: passwordController.text
     );
     Navigator.pop(context);


   } on FirebaseAuthException catch (e){

     Navigator.pop(context);
     
     if (e.code == 'user not found'){
        wrongEmailMessage();
     }
     else if (e.code == 'wrong password'){
       wrongPasswordMessage();
     }
   }



  }
  void wrongEmailMessage(){
    showDialog(context: context,
        builder: (context){
    return const AlertDialog(
        title: Text('Incorrect Email'),
      );
        },
    );
  }
  void wrongPasswordMessage(){
    showDialog(context: context,
      builder: (context){
       return const AlertDialog(
          title: Text('Incorrect Password'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
            
                // logo
                const Icon(
                  Icons.beach_access_sharp,
                  size: 100,
                ),
            
                const SizedBox(height: 30),
            
                // welcome back, you've been missed!
                const Text(
                  'Resort Revelation',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
            
                const SizedBox(height: 10),
            
                const Text(
                  'Your Ultimate Guide',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
            
                const SizedBox(height: 25),
            
                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
            
                const SizedBox(height: 10),
            
                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
            
                const SizedBox(height: 10),
            
                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 25),
            
                // sign in button
                MyButton(
                  onTap: signUserIn,
                ),
            
            
                const SizedBox(height: 10),
            
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
            
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}