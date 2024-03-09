
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationViewModel extends ChangeNotifier{
  final TextEditingController emailTextConroller = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController = TextEditingController();
  final TextEditingController usernameTextController = TextEditingController();
  final User? currentUser = FirebaseAuth.instance.currentUser;
  final CollectionReference usersRef = FirebaseFirestore.instance.collection("Users");

  void signIn(BuildContext context) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailTextConroller.text, password: passwordTextController.text);
    }on FirebaseAuthException catch (e) {
      displayMessage(context, e.code);
    }
  }
  void signUp() async{
    if (passwordTextController.text == confirmPasswordTextController.text){
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailTextConroller.text, password: passwordTextController.text);
          saveUser();
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

    Future<void> saveUser() async {
    try {
      print("PENIS");
      await usersRef.doc(emailTextConroller.text).set({
        'email': emailTextConroller.text,
        'username': usernameTextController.text,
        });
    } catch (e) {
      print('Error posting message: $e');
    }
  } 


}