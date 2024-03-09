import 'package:chat_app/screens/auth_screens/logIn_view.dart';
import 'package:chat_app/screens/home_screen/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CoreView extends StatefulWidget {
  CoreView({Key? key}) : super(key: key);

  @override
  State<CoreView> createState() => _CoreViewState();
}

class _CoreViewState extends State<CoreView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Show an error message
        } else {
          // Check if snapshot.data is not null before accessing it
          if (snapshot.hasData && snapshot.data != null) {
            return HomeView(); // User is authenticated, show HomeView
          } else {
            return LogInView(); // User is not authenticated, show LogInView
          }
        }
      },
    );
  }
}
