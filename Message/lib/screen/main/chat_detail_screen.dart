import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:message/controller/chat_controller.dart';
import 'package:message/controller/firebase_controller.dart';
import 'package:message/controller/socket_controller.dart';
import 'package:message/model/message_model.dart';
import 'package:message/screen/main/chat_screen.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../resources/constants/constants.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);
  static const String id = 'chat_detail_screen';

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

int count = 0;
bool stop = false;

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  ChatController chatController = ChatController();
  @override
  void initState() {
    super.initState();
    ChatController.readMessage();
    // SocketController.conSocket();
    SocketController.setUpSocket(chatController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ChatController.chatMess = <MessageModel>[].obs;
            Navigator.pushNamed(context, ChatScreen.id);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 8.w,
            color: const Color(0xFF7D0EB9),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(ChatScreen.imageFriend),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ChatScreen.fullNameFriend,
                  style: TextStyle(
                      // ignore: deprecated_member_use
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  ChatScreen.statusFriend == status.online.toString()
                      ? "online"
                      : 'offline',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    // ignore: deprecated_member_use
                    fontSize: 14.sp,
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: const Color(0xFF7D0EB9),
            icon: const Icon(Icons.phone),
          ),
          IconButton(
            onPressed: () {},
            color: const Color(0xFF7D0EB9),
            icon: const Icon(Icons.videocam),
          ),
          Container(
            width: 3.w,
            height: 3.w,
            decoration: BoxDecoration(
                color: ChatScreen.statusFriend == status.online.toString()
                    ? Colors.green
                    : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white38)),
          ),
          IconButton(
            onPressed: () {},
            color: const Color(0xFF7D0EB9),
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: const MessageStream(),
      bottomSheet: const BodyChatButtom(),
    );
  }
}

class BodyChatButtom extends StatefulWidget {
  const BodyChatButtom({Key? key}) : super(key: key);

  @override
  State<BodyChatButtom> createState() => _BodyChatButtomState();
}

class _BodyChatButtomState extends State<BodyChatButtom> {
  late String messageText;
  final messageTextController = TextEditingController();
  late String fileName;
  late String filePath;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: 10.h,
      decoration: kMessageContainerDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            color: Colors.lightBlueAccent.shade400,
            icon: const Icon(Icons.widgets_outlined),
          ),
          IconButton(
            onPressed: () async {
              XFile? images =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (images == null) {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No File Seclected'),
                  ),
                );
              }
              filePath = images!.path;
              fileName = images.name;
              DateTime now = DateTime.now();
              var hour = now.hour;
              var minute = now.minute;
              var year = now.year;
              var month = months[now.month - 1];
              var day = now.day;
              StorageController.uploadFile(fileName, filePath);
              Future.delayed(const Duration(seconds: 5), () {
                StorageController.downLoadUrl(fileName);
                Future.delayed(const Duration(seconds: 2), () {
                  ChatController.sendMessage(
                      ChatController.chatMess.length.toString(),
                      baseUrl,
                      ChatScreen.fullNameUser,
                      ChatScreen.fullNameFriend,
                      'image',
                      '$hour:$minute',
                      '$month $day,$year');
                });
              });
            },
            color: Colors.lightBlueAccent.shade400,
            icon: const Icon(Icons.camera_enhance),
          ),
          IconButton(
            onPressed: () async {
              XFile? images =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (images == null) {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No File Seclected'),
                  ),
                );
              }
              filePath = images!.path;
              fileName = images.name;
              StorageController.uploadFile(fileName, filePath);
              DateTime now = DateTime.now();
              var hour = now.hour;
              var minute = now.minute;
              var year = now.year;
              var month = months[now.month - 1];
              var day = now.day;
              Future.delayed(const Duration(seconds: 5), () {
                StorageController.downLoadUrl(fileName);
                Future.delayed(const Duration(seconds: 3), () {
                  ChatController.sendMessage(
                      ChatController.chatMess.length.toString(),
                      baseUrl,
                      ChatScreen.fullNameUser,
                      ChatScreen.fullNameFriend,
                      'image',
                      '$hour:$minute',
                      '$month $day,$year');
                });
              });
            },
            color: Colors.lightBlueAccent.shade400,
            icon: const Icon(Icons.photo),
          ),
          IconButton(
            onPressed: () {},
            color: Colors.lightBlueAccent.shade400,
            icon: const Icon(Icons.mic),
          ),
          Expanded(
            child: TextField(
              controller: messageTextController,
              onChanged: (value) {
                setState(() {});
                messageText = value;
              },
              decoration: kMessageTextFieldDecoration,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {});
              DateTime now = DateTime.now();
              var hour = now.hour;
              var minute = now.minute;
              var year = now.year;
              var month = months[now.month - 1];
              var day = now.day;
              // ignore: unnecessary_null_comparison
              if (messageTextController.text == '') {
                ChatController.sendMessage(
                    ChatController.chatMess.length.toString(),
                    Icons.send.toString(),
                    ChatScreen.fullNameUser,
                    ChatScreen.fullNameFriend,
                    'icon',
                    '$hour:$minute',
                    '$month $day,$year');
              } else {
                messageTextController.clear();
                ChatController.sendMessage(
                    ChatController.chatMess.length.toString(),
                    messageText,
                    ChatScreen.fullNameUser,
                    ChatScreen.fullNameFriend,
                    'text',
                    '$hour:$minute',
                    '$month $day,$year');
              }
            },
            color: Colors.lightBlueAccent.shade400,
            icon: messageTextController.text == ''
                ? const Icon(Icons.thumb_up_alt)
                : const Icon(Icons.send),
          ), //thumb_up_alt
        ],
      ),
    ));
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Obx((() => ListView.builder(
          reverse: true,
          shrinkWrap: true,
          itemCount: ChatController.chatMess.length,
          itemBuilder: (context, index) {
            var message =
                ChatController.chatMess.reversed.toList()[index];
            return MessageBubble(
              text: message.messageText,
              sender: message.sendBy,
              isMe: ChatScreen.fullNameUser == message.sendBy,
              type: message.type,
              timer: '${message.timerMMDDYYYY} AT ${message.timerHHMM}',
            );
          }))),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.text,
    required this.sender,
    required this.isMe,
    required this.type,
    required this.timer,
    Key? key,
  }) : super(key: key);
  final String sender;
  final String text;
  final bool isMe;
  final String type;
  final String timer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
      child: Column(
        children: [
          Text(
            timer,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: type != 'icon'
                    ? Container(
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(
                                topRight: const Radius.circular(30),
                                bottomRight: isMe
                                    ? const Radius.circular(5)
                                    : const Radius.circular(30),
                                topLeft: const Radius.circular(30),
                                bottomLeft: isMe
                                    ? const Radius.circular(30)
                                    : const Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: type == 'text'
                              ? Text(
                                  text,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                )
                              : Image.network(
                                  text,
                                  width: 30.w,
                                ),
                        ),
                      )
                    : Icon(
                        Icons.thumb_up_alt,
                        size: 15.w,
                        color: Colors.blueAccent,
                      ),
              )
            ],
          ),
        ],
      ),
    );
  }

  getMessageType(messageType) {
    // start message
    messageType == 1
        ? {
            BorderRadius.only(
                topRight: const Radius.circular(30),
                bottomRight:
                    isMe ? const Radius.circular(5) : const Radius.circular(30),
                topLeft: const Radius.circular(30),
                bottomLeft:
                    isMe ? const Radius.circular(30) : const Radius.circular(5))
          }
        // middle message
        : messageType == 2
            ? {
                BorderRadius.only(
                    topRight: isMe
                        ? const Radius.circular(5)
                        : const Radius.circular(30),
                    bottomRight: isMe
                        ? const Radius.circular(5)
                        : const Radius.circular(30),
                    topLeft: isMe
                        ? const Radius.circular(30)
                        : const Radius.circular(5),
                    bottomLeft: isMe
                        ? const Radius.circular(30)
                        : const Radius.circular(5))
              }
            // end message
            : messageType == 3
                ? {
                    BorderRadius.only(
                        topRight: isMe
                            ? const Radius.circular(5)
                            : const Radius.circular(30),
                        bottomRight: const Radius.circular(30),
                        topLeft: isMe
                            ? const Radius.circular(30)
                            : const Radius.circular(5),
                        bottomLeft: const Radius.circular(30))
                  }
                // standalone message
                : {const BorderRadius.all(Radius.circular(30))};
  }
  // for sender bubble

}
