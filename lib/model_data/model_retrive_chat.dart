import 'package:cloud_firestore/cloud_firestore.dart';

class ModelChat {
  final String chatName;
  final Timestamp timestamp;
  final String userName;

  ModelChat(
      {required this.chatName,
      required this.timestamp,
      required this.userName});

  factory ModelChat.fromSnapshot(DocumentSnapshot snap) {
    Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
    return ModelChat(
        chatName: data['message'],
        timestamp: data['timestamp'],
        userName: data['me']);
  }
}
