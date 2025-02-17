import 'package:cloud_firestore/cloud_firestore.dart';
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
            _buildUserInput(),
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
            return const Text("...loading");
          }
          //return listview
          return ListView(
            children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
          );
        },
    );
  }
  Widget _buildMessageItem (DocumentSnapshot doc){
    Map<String, dynamic> data = doc.data() as Map <String, dynamic>;
    return Text(data["message"]);
  }
  Widget _buildUserInput(){
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller : _messageController,
            decoration: InputDecoration(
            hintText : "Type a message",),
            obscureText : false,
          ),
        ),
        IconButton(onPressed: sendMessage, icon: const Icon(Icons.arrow_circle_up))
      ],
    );
  }
}
