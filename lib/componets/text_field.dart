import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.textcontroler, required this.hintText, required this.obscureText, required this.focusNode});

  final TextEditingController textcontroler;
  final String hintText;
  final bool obscureText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textcontroler,
      obscureText: obscureText,
      focusNode: focusNode,
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
          borderRadius: const BorderRadius.all(Radius.circular(15))
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        fillColor: Theme.of(context).colorScheme.tertiary,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary), 
      ),
    );
  }
}