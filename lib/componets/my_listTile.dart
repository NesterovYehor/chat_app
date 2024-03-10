import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  MyListTile({super.key, required this.username, required this.onTap});

  final username;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(10)
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(Icons.person, color: Theme.of(context).colorScheme.primary,),
            const SizedBox(width: 20,),
            Text(username, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w300),),
          ],
        ),
      ),
    );
  }
}