import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.message, required this.isCurrentUser});

  final String message;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.green : Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(10),
          topRight: const Radius.circular(10),
          bottomLeft: isCurrentUser ? const Radius.circular(10) : Radius.zero,
          bottomRight: isCurrentUser ? Radius.zero : const Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Text(
        message, 
        style: const TextStyle(color: Colors.white)),
    );
  }
}
