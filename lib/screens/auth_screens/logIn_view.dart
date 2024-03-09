import 'package:chat_app/componets/my_btn.dart';
import 'package:chat_app/componets/text_field.dart';
import 'package:chat_app/screens/auth_screens/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          backgroundColor: Colors.grey.shade300, 
          body:  Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.message,
                    size: 100.0, 
                    color: Colors.grey[800],
                  ),
                  const SizedBox(height: 50,),
                  const Text("Welcome back you've been missed!", style: TextStyle(fontSize: 16),),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: MyTextField(
                      textcontroler: vm.emailTextConroller, 
                      hintText: "Email", 
                      obscureText: false
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MyTextField(
                      textcontroler: vm.passwordTextController, 
                      hintText: "Password", 
                      obscureText: true
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: MyButton(
                      onTap: () {
                        vm.signIn;
                      }, 
                      title: 'Sign In',
                      ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not a member?"),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text("Register Now", style: TextStyle(fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
