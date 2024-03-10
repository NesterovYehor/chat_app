import 'package:chat_app/services/auth.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{
  final AuthService authService = AuthService();

  void loguot() {
    authService.signOut();
  }

  Stream<List<UserModel>> downloadUsers() {
    return FirebaseFirestore.instance.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return UserModel.fromFirestore(doc.data());
      }).toList(); 
    });
  }
}