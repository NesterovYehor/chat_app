
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/firecore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationViewModel extends ChangeNotifier{
  final TextEditingController emailTextConroller = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController = TextEditingController();
  final TextEditingController usernameTextController = TextEditingController();
  final AuthService authService = AuthService();
  final FireStoreService fireStoreService = FireStoreService();

  void signIn(BuildContext context) async{
    try{
      await authService.signInWithEmailPassword(emailTextConroller.text, passwordTextController.text);
      emailTextConroller.clear();
      passwordTextController.clear();
    }on FirebaseAuthException catch (e) {
      displayMessage(context, e.code);
    }
  }
  void signUp(BuildContext context) async{
    if (passwordTextController.text == confirmPasswordTextController.text){
     await authService.signUp(emailTextConroller.text, passwordTextController.text,);
     if (authService.getCurrentUser() != null){
          await fireStoreService.saveUser(emailTextConroller.text, usernameTextController.text, authService.getCurrentUser()!.uid);
     }
     else{
      displayMessage(context, "ERROR WITH FIREBASE AUTH");
     }
          emailTextConroller.text = "";
          passwordTextController.text = "";
          confirmPasswordTextController.text = "";
          usernameTextController.text = "";
    }
  }

  void displayMessage(BuildContext context, String message) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(message),
        );
      },
    );
  }
}