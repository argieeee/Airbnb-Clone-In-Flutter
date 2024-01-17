import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_button2.dart';
import '../components/my_textfield.dart';


class RegisterPage extends StatefulWidget {

  final void Function()? onTap;

    const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  //editing text
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  //sign up method
  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );


    try{
      if(passwordController.text == confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      }else{
        showErrorMessage("Passwords don't match!");
      }

      Navigator.pop(context);

    } on FirebaseAuthException catch (e){
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message){
    showDialog(
      context: context,
      builder:(context){
        return  AlertDialog(
          backgroundColor: Colors.grey,
          title: Center(
            child: Text(
              message ,
              style: const TextStyle(
                  color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                const SizedBox(height: 25),

                const Icon(Icons.beach_access,
                  size: 100,
                ),

                const SizedBox(height: 25),

            const    Text(
                  'Resort Revelation',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 5),

              const  Text(
                  'Your Ultimate Guide',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 25),

                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const  SizedBox(height: 10),

                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const  SizedBox(height: 10),

                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const  SizedBox(height: 10),

                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                const  SizedBox(height: 25),

                MyButton2(
                  onTap: signUserUp ,
                ),

                const  SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),

                    const SizedBox(width: 4),

                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
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