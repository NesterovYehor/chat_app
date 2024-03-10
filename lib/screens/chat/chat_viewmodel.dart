import 'package:chat_app/services/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatViewModel extends ChangeNotifier{
  final _chatService = ChatService();
  final messageController = TextEditingController();

  void sendMessage(String receiverID, BuildContext context) async{
    if (messageController.text.isNotEmpty){
       await _chatService.sendMessage(receiverID, messageController.text);
       messageController.clear();
    }else{
      showDialog(context: context,
       builder: (context) => const AlertDialog(
        title: Text("Please enter your message"),
       ), 
       );
    }
  }
  Stream<QuerySnapshot> getMessages(String otherUserID){
    return _chatService.getMessages(_chatService.currentUser!.uid, otherUserID);
  }

  bool isCurrentUser(Map<String, dynamic> data){
    return  data['senderID'] == _chatService.currentUser!.uid;
  }


}