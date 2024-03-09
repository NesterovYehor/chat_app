import 'package:chat_app/componets/drawer.dart';
import 'package:chat_app/componets/list_tile.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/screens/home_screen/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key); // Corrected super constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // This removes the back button
            title: const Text(
              "H O M E",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.grey[500],
            actions: [
              IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {},
              ), 
            ],
          ),
          drawer: MyDrawer(),
          body: Consumer<HomeViewModel>(
            builder: ( context,  vm,  child) {
              return Center(
              child: Column(
                children: [
                  StreamBuilder<List<UserModel>>(
                    stream: vm.downloadUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData){
                        final List<UserModel>? users = snapshot.data;
                        return ListView.builder(
                          itemCount: users?.length,
                          itemBuilder: (context,  index) {
                            return MyListTile(username: users![index].username);
                          }
                          );
                      }
                      else{
                        return Text("ERROR: ");
                        }
                      },
                      )
                  ],
                ),
              );
            }, 
          ),
        );
  }
}
