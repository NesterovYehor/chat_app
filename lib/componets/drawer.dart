import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(Icons.message, color: Theme.of(context).colorScheme.primary, size: 40,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                      title: Text("H O M E", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                      leading: Icon(Icons.home, color: Theme.of(context).colorScheme.primary,),
                      onTap: () => Navigator.pop(context),
                )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                      title: Text("S E T T I N G S", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                      leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.primary,),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/settings');
                      },
                )
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
                  title: Text("L O G O U T", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                  leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.primary,),
            )
          ),
        ],
      ),
    );
  }
}