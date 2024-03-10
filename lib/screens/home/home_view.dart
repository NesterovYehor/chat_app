import 'package:chat_app/componets/drawer.dart';
import 'package:chat_app/componets/my_listTile.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/screens/chat/chat_view.dart';
import 'package:chat_app/screens/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: Theme.of(context).appBarTheme.iconTheme,
            title: Text(
              "U S E R S",
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () => vm.loguot(),
              ),
            ],
          ),
          drawer: const MyDrawer(),
          body: Center(
            child: StreamBuilder<List<UserModel>>(
              stream: vm.downloadUsers(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<UserModel>? users = snapshot.data;
                  final List<UserModel> otherUsers = users!.where((user) => user.userId != vm.authService.getCurrentUser()?.uid).toList();
                  return ListView.builder(
                    itemCount: otherUsers.length,
                    itemBuilder: (context, index) {
                      return MyListTile(
                        username: otherUsers[index].username,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatView(user: otherUsers[index]),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Text("ERROR ${snapshot.error}");
                }
              },
            ),
          ),
        );
      },
    );
  }
}
