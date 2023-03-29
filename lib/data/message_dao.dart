import 'package:chat_flutter/data/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageDao {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('messages');

  void saveMessage(Message message) {
    collection.add(message.toJson());
  }

  Stream<QuerySnapshot> getMessageStream() {
    return collection.snapshots();
  }
}
