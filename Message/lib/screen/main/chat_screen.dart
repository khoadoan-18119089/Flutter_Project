import 'package:flutter/material.dart';
import 'package:message/widget/body_chat_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const String id = 'chat_screen';
  static String fullNameFriend = '';
  static String imageFriend = '';
  static String statusFriend = '';
  static String emailUser = '';
  static String fullNameUser = '';
  static String imageUser = '';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(ChatScreen.imageUser),
                fit: BoxFit.cover,
              )),
        ),
        title: const Text(
          "Chats",
          style: TextStyle(
            fontSize: 22,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
              ),
              child: IconButton(
                onPressed: () async {},
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.black87,
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.black87,
                ),
              )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: const BodyChatScreen(),
    );
  }
}
