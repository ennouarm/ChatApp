import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newproj3/Services/auth/auth_service.dart';

class ChatServices{
  // get instance of firestore
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
// get user stream
Stream<List<Map<String, dynamic>>> getUsersStream(){
return _firestore.collection("Users").snapshots().map((snapshot){
  return snapshot.docs.map((doc){
    final user = doc.data();
    return user;
}).toList();
});
}
//send messages
Future<void> sendMessage(String receiverId, message) async{
  // get current user info
  final String currentUserid = _auth.currentUser!.uid;
  final String CurrentUserEmail = _auth.currentUser!.email!;
  final Timestamp timestamp = Timestamp.now();

  // create a new message

  //construct a chatroom id for the two users(sorted to ensure uniqueness)

  //add new message to database

}
// get messages

}