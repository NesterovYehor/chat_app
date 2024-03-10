import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference usersRef = FirebaseFirestore.instance.collection("Users");

  Future<void> saveUser(String email, username, userId) async {
    try {
      await usersRef.doc(email).set({
        'email': email,
        'username': username,
        'userId' : userId,
        });
    } catch (e) {
      print('Error posting message: $e');
    }
  }


}