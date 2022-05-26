import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:message/resources/constants/constants.dart';
import 'package:message/screen/main/chat_detail_screen.dart';
import 'package:message/screen/main/chat_screen.dart';

class BodyChatScreen extends StatefulWidget {
  const BodyChatScreen({Key? key}) : super(key: key);

  @override
  State<BodyChatScreen> createState() => _BodyChatScreenState();
}

class _BodyChatScreenState extends State<BodyChatScreen> {
  final _store = FirebaseFirestore.instance;
  late bool screens = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 6.w,
            left: 5.w,
            right: 5.w,
            top: 4.w,
          ),
          child: Container(
            width: double.infinity,
            height: 10.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Expanded(
                  child: Icon(
                    Icons.search,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 5.w,
            right: 5.w,
            top: 4.w,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Column(
                    children: [
                      Container(
                        width: 18.w,
                        height: 18.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.video_call,
                              size: 33,
                            ),
                            onPressed: () async {
                              setState(() {});
                              await _store
                                  .collection('user')
                                  .doc(ChatScreen.emailUser)
                                  .update(
                                {
                                  'story': story.yes.toString(),
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.w),
                        child: SizedBox(
                          width: 19.w,
                          child: const Align(
                              child: Text(
                            'Your Story',
                            overflow: TextOverflow.ellipsis,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: StoryStream())
              ],
            ),
          ),
        ),
        MessageStream(),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.lightBlueAccent,
              ),
            ),
          ),
          height: 10.h,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {});
                        screens = true;
                      },
                      icon: Icon(
                        FontAwesomeIcons.facebookMessenger,
                        color: screens
                            ? Colors.lightBlueAccent
                            : Colors.grey.shade500,
                      ),
                    ),
                    Text(
                      'Chats',
                      style: TextStyle(
                          color: screens
                              ? Colors.lightBlueAccent
                              : Colors.grey.shade500,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {});
                        screens = false;
                      },
                      icon: Icon(
                        Icons.people_alt,
                        color: screens
                            ? Colors.grey.shade500
                            : Colors.lightBlueAccent,
                      ),
                    ),
                    Text(
                      'People',
                      style: TextStyle(
                          color: screens
                              ? Colors.grey.shade500
                              : Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class StoryStream extends StatelessWidget {
  final _store = FirebaseFirestore.instance;
  StoryStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _store.collection('user').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final friends = snapshot.data!.docs;
        List<StoryBubble> storyBubbles = [];
        for (var friend in friends) {
          final storyBubble = StoryBubble(
            fullName: friend['fullName'],
            imageFriend: friend['image'],
            storyUser: friend['story'],
          );
          storyBubbles.add(storyBubble);
        }
        return Row(
          children: List.generate(storyBubbles.length, (index) {
            var dataStory = storyBubbles[index];
            return StoryBubble(
              fullName: dataStory.fullName,
              imageFriend: dataStory.imageFriend,
              storyUser: dataStory.storyUser,
            );
          }),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class StoryBubble extends StatelessWidget {
  String fullName;
  String imageFriend;
  String storyUser;
  StoryBubble(
      {required this.fullName,
      required this.imageFriend,
      required this.storyUser,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatScreen.fullNameUser == fullName
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: storyUser == story.yes.toString()
                        ? Colors.lightBlueAccent.shade200
                        : Colors.grey.shade300,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(imageFriend),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: 75,
                    child: Align(
                        child: Text(
                      fullName,
                      overflow: TextOverflow.ellipsis,
                    )),
                  ),
                )
              ],
            ),
          );
  }
}

class MessageStream extends StatelessWidget {
  final _store = FirebaseFirestore.instance;

  MessageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _store.collection('user').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final friends = snapshot.data!.docs;
        List<MessageChat> messageBubbles = [];
        for (var friend in friends) {
          final messageBubble = MessageChat(
            fullName: friend['fullName'],
            image: friend['image'],
            statusUser: friend['status'],
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                height: 1.h,
              );
            },
            itemCount: messageBubbles.length,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            itemBuilder: (context, index) {
              var dataUser = messageBubbles[index];
              return Card(
                child: MessageChat(
                  fullName: dataUser.fullName,
                  image: dataUser.image,
                  statusUser: dataUser.statusUser,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class MessageChat extends StatelessWidget {
  String fullName;
  String image;
  String statusUser;
  MessageChat(
      {required this.fullName,
      required this.image,
      required this.statusUser,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatScreen.fullNameUser == fullName
        ? const SizedBox()
        : InkWell(
            onTap: () {
              ChatScreen.fullNameFriend = fullName;
              ChatScreen.imageFriend = image;
              ChatScreen.statusFriend = statusUser;
              Navigator.pushNamed(context, ChatDetailScreen.id);
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: 5.w, right: 5.w, top: 1.w - 1, bottom: 1.w - 1),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 17.w,
                    height: 17.w,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.blueAccent, width: 3)),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 20.w,
                              height: 20.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(image),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        statusUser == status.online.toString()
                            ? Positioned(
                                top: 12.w,
                                left: 13.w,
                                child: Container(
                                  width: 5.w,
                                  height: 5.w,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 3)),
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        fullName,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      SizedBox(
                        width: 100.w - 175,
                        child: Text(
                          'aaaa' " - " '20:00',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
