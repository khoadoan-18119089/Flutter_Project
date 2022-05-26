import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:message/model/message_model.dart';

import '../resources/constants/constants.dart';
import '../screen/main/chat_screen.dart';

import 'firebase_controller.dart';

class ChatController extends GetxController {
  static var chatMess = <MessageModel>[].obs;
  static void sendMessage(String id, String text, String user, String friend,
      String type, String timerHHMM, String timerMMDDYYYY) async {
    var messageJson = {
      'id': id,
      'messageText': text,
      'sendBy': user,
      "type": type,
      'timerHHMM': timerHHMM,
      'timerMMDDYYYY': timerMMDDYYYY,
    };
    DatabaseController().sendMessage(id, user, friend, text, type, timerHHMM, timerMMDDYYYY);
    socket.emit('messages', messageJson);
    ChatController.chatMess.add(MessageModel.formJson(messageJson));
  }

  static Future<dynamic> readMessage() async {
    await FirebaseFirestore.instance
        .collection('messages')
        .doc(ChatScreen.fullNameUser)
        .collection(ChatScreen.fullNameFriend)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var dataUser in querySnapshot.docs) {
        Map<String, String> data = {
          'id': dataUser['id'],
          'messageText': dataUser['messageText'],
          'sendBy': dataUser['sendBy'],
          'type': dataUser['type'],
          'timerHHMM': dataUser['timerHHMM'],
          'timerMMDDYYYY': dataUser['timerMMDDYYYY'],
        };
        socket.emit('messages', data);
        ChatController.chatMess.add(MessageModel.formJson(data));
        // }
      }
    });
  }
}
