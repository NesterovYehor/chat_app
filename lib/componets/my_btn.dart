import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(10)
      ),
      child:  Center(
        child: Text(
          title, 
          style:  TextStyle(
            color: Theme.of(context).colorScheme.primary, 
            fontWeight: FontWeight.bold, 
            fontSize: 16
            )),
      ),
    );
  }
}