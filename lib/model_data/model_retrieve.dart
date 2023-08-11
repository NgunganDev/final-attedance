import 'package:cloud_firestore/cloud_firestore.dart';

class ModelFire {
  final String userName;
  final String userEmail;
  final String bio;
  final String photoUrl;
  final String type;

  ModelFire({
    required this.userName,
    required this.userEmail,
    required this.bio,
    required this.photoUrl,
    required this.type
  });

  factory ModelFire.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return ModelFire(
      userName: data['username'],
      userEmail: snapshot.id,
      photoUrl: data['photoUrl'],
      bio: data['bio'],
      type: data['type']
    );
  }
}