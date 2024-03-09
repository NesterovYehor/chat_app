import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{
  Future<void> loguot() async {
    await FirebaseAuth.instance.signOut();
    print("PENISSSSS");
  }

  Stream<List<UserModel>> downloadUsers() {
    return FirebaseFirestore.instance.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return UserModel.fromFirestore(doc.data());
      }).toList(); 
    });
  }
}