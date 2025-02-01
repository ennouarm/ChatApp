import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String SenderId;
  final String SenderEmail;
  final String ReceiverId;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.SenderId,
    required this.SenderEmail,
    required this.ReceiverId,
    required this.message,
    required this.timestamp
});
//convert to a map
Map<String, dynamic> toMap(){
  return{
    'SenderId' : SenderId,
    'SenderEmail' : SenderEmail,
    'ReceiverId' : ReceiverId,
    'message' : message,
    'timestamp' : timestamp,
  };
}

}