import 'package:flutter/material.dart';
import 'package:newproj3/Components/my_drawer.dart';

import '../Components/UserTiles.dart';
import '../Services/Chat/chat_services.dart';
import '../Services/auth/auth_service.dart';
import 'ChatPage.dart';


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
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context){
    if(userData["email"] != _authService.getCurrentUser()!.email){
      return UserTiles(
        text: userData["email"],
        onTap: () {
          MaterialPageRoute(
            builder : (context)  => ChatPage(receiverEmail:userData["email"],
            ),
          );
        },);
    } else{
      return Container();
    }
  }
}
