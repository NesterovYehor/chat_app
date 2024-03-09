import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.onTap, required this.title});

  void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10)
        ),
        child:  Center(
          child: Text(
            title, 
            style: const TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold, 
              fontSize: 16
              )),
        ),
      ),
    );
  }
}