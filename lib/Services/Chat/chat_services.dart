import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/message.dart';

class ChatServices {
  // get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

// get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

//send messages
  Future<void> sendMessage(String receiverId, message) async {
    // get current user info
    final String currentUserid = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    // create a new message
    Message newMessage = Message(
        SenderId: currentUserid,
        SenderEmail: currentUserEmail,
        ReceiverId: receiverId,
        message: message,
        timestamp: timestamp);
    //construct a chatroom id for the two users(sorted to ensure uniqueness)
    List<String> ids = [currentUserid, receiverId];
    ids.sort();
    String chatRoomId = ids.join('_');
    //add new message to database
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

// get messages
  Stream<QuerySnapshot> getMessages(String userId, otherUserId) {
    // construct a chatroom id
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timeStamp", descending: false)
        .snapshots();
  }
}
