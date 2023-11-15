import 'package:chat_app/components/avatar.dart';
import 'package:chat_app/components/circle_icon_button.dart';
import 'package:chat_app/components/search_bar.dart';
import 'package:chat_app/components/tbt_circle_avatar.dart';
import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/screens/chat_screen/controller/chat_controller.dart';
import 'package:chat_app/screens/detail_chat_screen.dart/detail_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wow_views/common/color.dart';
import 'package:wow_views/components/wow_app_bar.dart';
import 'package:wow_views/components/wow_text.dart';
import 'package:wowit/widgets/wow_icon.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key) {
    chatController.loaduser();
  }

  final chatController = Get.put(ChatController());
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, Object?>>>(
      future: chatController.loaduser(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            body: Text('Something went wrong'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        var listUser = snapshot.data!;
        return FutureBuilder<Map<String, Object?>>(
          future: chatController.dataUser(
              email: userController.loggedInUser.email!,
              listUser: snapshot.data!),
          builder: (_, dataSnapshot) {
            if (dataSnapshot.hasError) {
              return const Scaffold(
                body: Text('Something went wrong'),
              );
            }
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            var model = UserModer(dataSnapshot.data!);
            return Scaffold(
              appBar: WowAppBar(
                  titleWidget: Row(
                    children: [
                      Avatar(name: model.avatar),
                      const SizedBox(width: 8),
                      WowText.title('Chats'),
                    ],
                  ),
                  hasLeading: false,
                  actions: [
                    CircleIconButton(
                      iconData: Icons.camera_alt,
                      onPressh: () => MyApp.dangPhatTrien(),
                    ),
                    const SizedBox(width: 8),
                    CircleIconButton(
                      iconData: Icons.edit,
                      onPressh: () => MyApp.dangPhatTrien(),
                    ),
                    const SizedBox(width: 32),
                  ]),
              body: GetBuilder<ChatController>(
                  id: 'body',
                  builder: (_) {
                    return body(chatController.titleTab, listUser: listUser);
                  }),
              bottomNavigationBar: bottomNavigationBar(),
            );
          },
        );
      },
    );
  }

  Widget chats(List<Map<String, Object?>> listUser) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(
            onChanged: (value) {},
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
            height: 40,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            hintText: 'Search',
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 82,
                  height: 100,
                  child: Column(
                    children: [
                      Avatar.url(
                        url:
                            'https://cdn-icons-png.flaticon.com/512/45/45010.png',
                        height: 80,
                      ),
                      WowText.listItem('Your Story')
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: listUser.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (_, index) {
                      return story(listUser[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listUser.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, index) {
              return userCard(listUser[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget body(int index, {required List<Map<String, Object?>> listUser}) {
    switch (index) {
      case 0:
        return chats(listUser);
      case 1:
        return people();
    }
    return const SizedBox.shrink();
  }

  Widget people() {
    return Center(
      child: WowText.listTitle('Chức năng đang phát triển'),
    );
  }

  Widget story(Map<String, Object?> data) {
    var model = UserModer(data);
    return InkWell(
      onTap: () {
        print(data);
        MyApp.dangPhatTrien();
      },
      child: SizedBox(
        width: 82,
        height: 100,
        child: Column(
          children: [
            TBTCircleAvatar(
              name: model.avatar,
              widthCircleAvatar: 80,
            ),
            WowText.listItem(model.name)
          ],
        ),
      ),
    );
  }

  Widget userCard(Map<String, Object?> data) {
    var model = UserModer(data);
    return SizedBox(
      height: 80,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: TBTCircleAvatar(name: model.avatar, widthCircleAvatar: 56),
          title: WowText.listItem(model.name),
          subtitle: WowText.body('aaaa - 18:18'),
          onTap: () {
            MyApp.to(() => DetailChatScreen(dataUser: data));
          },
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ChatController>(
        id: 'body',
        builder: (_) {
          return BottomNavigationBar(
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: TBTColor.greyA4AF,
            onTap: (index) {
              chatController.onClickTab(index);
            },
            currentIndex: chatController.titleTab,
            items: const [
              BottomNavigationBarItem(
                icon: WowIcon(
                  FontAwesomeIcons.facebookMessenger,
                  size: 40,
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: WowIcon(
                  Icons.people_alt,
                  size: 40,
                ),
                label: 'People',
              ),
            ],
          );
        });
  }
}
