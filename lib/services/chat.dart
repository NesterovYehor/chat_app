import 'package:chat_app/models/message.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/firecore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FireStoreService _firestore;
  final AuthService _auth;
  late User? currentUser;

  ChatService() : _firestore = FireStoreService(), _auth = AuthService() {
    currentUser = _auth.getCurrentUser();
  }

  Future<void> sendMessage(String receiverID, message) async{
    final String currentUserId = currentUser!.uid;
    final String currentEmail = currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      senderID: currentUserId, 
      senderUsername: currentEmail, 
      reciverID: receiverID, 
      message: message, 
      timestamp: timestamp
      );

    List<String> ids = [currentUserId, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    await _firestore.firestore.collection('chat_rooms').doc(chatRoomID).collection('messages').add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    try{
     return _firestore.firestore.collection('chat_rooms').doc(chatRoomID).collection('messages').orderBy('timestamp', descending: false).snapshots();
    }catch (e){
      throw (e);
    }
  }

  void getReceiverID(){
    
  }


}
