import 'package:flutter/material.dart';
import 'package:newproj3/Services/Chat/chat_services.dart';
import 'package:newproj3/Services/auth/auth_service.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverId;
  ChatPage({super.key, required this.receiverEmail, required this.receiverId});

  final TextEditingController _messageController = TextEditingController();

  final ChatServices _chatServices = ChatServices();
  final AuthService _authService = AuthService();
  void sendMessage() async {
    if(_messageController.text.isNotEmpty){
      await _chatServices.sendMessage(receiverId, _messageController.text);
      _messageController.clear();
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receiverEmail),),
      body: Column(
        children: [
          Expanded(
            child: _buildMesasgeList(),),
        ],
      ),
    );
  }
  // build a message list
  Widget _buildMesasgeList(){
    String senderId = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatServices.getMessages(receiverId, senderId),
        builder: (context, snapshot){
          //error
          if(snapshot.hasError){
            return const Text("Error");
          }
          //loading
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Text("...loading")
          }
          //return listview
          return ListView(
            children: snapshot.data!.docs.map((doc) => _buildMesssageItem(doc).toList()),
          );
        },
    );
  }
}
