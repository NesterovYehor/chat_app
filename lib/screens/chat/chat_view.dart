import 'package:chat_app/componets/chat_bubble.dart';
import 'package:chat_app/componets/text_field.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/screens/chat/chat_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key, required this.user}) : super(key: key);

  final UserModel user;


  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
    FocusNode myFocusNode = FocusNode();
    final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();

    myFocusNode.addListener(() { 
      if (myFocusNode.hasFocus){
        Future.delayed(const Duration(milliseconds: 500), () => scrollDown());
      }
    });
    Future.delayed(const Duration(milliseconds: 100), () => scrollDown());
  }

  @override 
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  void scrollDown(){
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent, 
    duration: const Duration(seconds: 1), 
    curve: Curves.fastOutSlowIn
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(widget.user.username, style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
          ),
          body: Column(
            children: [
              StreamBuilder(
                stream: vm.getMessages(widget.user.userId),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LinearProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return Text("No data available");
                  }
                  return Expanded(
                    child: ListView(
                      controller: _scrollController,
                      children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                        textcontroler: vm.messageController,
                        hintText: "Type a message",
                        obscureText: false, 
                        focusNode: myFocusNode,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        scrollDown();
                        vm.sendMessage(widget.user.userId, context);
                      },
                      icon:  Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green
                        ),
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Icon(Icons.arrow_upward_outlined, color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Consumer<ChatViewModel>(
      builder: (context,  vm,  child) { 
        final bool isCurrentUser = vm.isCurrentUser(data);
        return Container(
          alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              ChatBubble(message: data['message'], isCurrentUser: isCurrentUser),
            ],
          ),
        );
       },
    );
  }
}
