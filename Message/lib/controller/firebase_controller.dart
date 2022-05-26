import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;

import 'package:message/model/message_model.dart';
import '../resources/constants/constants.dart';

class StorageController {
  static Future<void> uploadFile(
    String fileName,
    String filePath,
  ) async {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    File file = File(filePath);
    try {
      await storage.ref('image/$fileName').putFile(file);
      // ignore: empty_catches
    } on firebase_core.FirebaseException {}
  }

  static Future downLoadUrl(String name) async {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    baseUrl = await storage.ref('image/$name').getDownloadURL();
  }
}

class DatabaseController {
  var now = DateTime.now();
  
  final cloud_firestore.FirebaseFirestore store =
      cloud_firestore.FirebaseFirestore.instance;
  Future<void> sendMessage(String id, String user, String friend,
      String messageText, String type, String HM, String MDY) async {
    
    store
        .collection('messages')
        .doc(user)
        .collection(friend)
        .doc(int.parse(id) < 10 ? '0$id' : id)
        .set(
          MessageModel(
                  id: id,
                  messageText: messageText,
                  sendBy: user,
                  type: type,
                  timerHHMM: HM,
                  timerMMDDYYYY: MDY)
              .toJson(),
        );
    store
        .collection('messages')
        .doc(friend)
        .collection(user)
        .doc(int.parse(id) < 10 ? '0$id' : id)
        .set(
          MessageModel(
                  id: id,
                  messageText: messageText,
                  sendBy: user,
                  type: type,
                  timerHHMM: HM,
                  timerMMDDYYYY: MDY)
              .toJson(),
        );
  }
}
