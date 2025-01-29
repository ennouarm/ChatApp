import 'package:flutter/material.dart';
import 'package:newproj3/Components/my_drawer.dart';

import '../Services/Chat/chat_services.dart';
import '../Services/auth/auth_service.dart';


class HomePage extends StatelessWidget {

  HomePage({super.key});

  final ChatServices _chatService = ChatServices();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home")),

      ),
      drawer: my_drawer(),
      body: _builderList(),
    );
  }

  // build a list of users except for the current logger in user
  Widget _builderList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text("error");
        }
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        //return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem)
              .toList(),
        );
      },
    );
  }
  Widget _buildUserListItem(Map<Stirng, dynamic> userData, BuildContext context){
    return UserTiles();
  }
}
