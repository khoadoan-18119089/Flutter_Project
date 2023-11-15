import 'package:chat_app/components/avatar.dart';
import 'package:chat_app/components/circle_icon_button.dart';
import 'package:chat_app/components/mess_card.dart';
import 'package:chat_app/components/tbt_text_form_field.dart';
import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/model/mess_model.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/screens/detail_chat_screen.dart/controller/detail_chat_controller.dart';
import 'package:chat_app/screens/video_call/controller/pages/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wow_views/common/color.dart';
import 'package:wow_views/components/wow_app_bar.dart';
import 'package:wow_views/components/wow_text.dart';
import 'package:wowit/widgets/wow_icon.dart';

class DetailChatScreen extends StatelessWidget {
  final Map<String, Object?> dataUser;
  DetailChatScreen({Key? key, required this.dataUser}) : super(key: key);

  final controller = Get.put(DetailChatController());
  final userController = Get.put(UserController());
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.emailNhan = UserModer(dataUser).email;
    List<Map<String, Object?>> listData = [];
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        appBar: appBar(MyApp.fortmat(listData.length)),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('messager')
                .doc(userController.loggedInUser.email)
                .collection(controller.emailNhan)
                .snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              var listMess = snapshot.data!.docs;
              controller.listMessLenght = listMess.length;
              listData.clear();
              for (var data in listMess) {
                listData.add({
                  'ID': data['ID'],
                  'mess': data['mess'],
                  'timer': data['timer'],
                  'emailNguoiGui': data['emailNguoiGui'],
                  'type': data['type'],
                  'trangThaiCall': data['trangThaiCall'],
                });
              }
              for (var data in listData) {
                var model = MessModel(data);
                model.call == 'goi'
                    ? Future.delayed(Duration.zero, () {
                        MyApp.to(IndexPage(
                          dataUser,
                          chale: model.mess,
                          id: model.iD,
                          emaqilNhan: UserModer(dataUser).email,
                        ));
                      })
                    : null;
              }
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                reverse: true,
                padding: const EdgeInsets.only(
                    top: 16, bottom: 56, left: 16, right: 16),
                itemCount: listData.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, index) {
                  return MessCard(
                    listData.reversed.toList()[index],
                    dataUser: dataUser,
                    onTap: () {
                      controller.message =
                          '${userController.loggedInUser.email} to ${UserModer(dataUser).email}';
                      controller.sendCall();
                      MyApp.to(IndexPage(
                        dataUser,
                          id: MessModel(listData.reversed.toList()[index]).iD,
                          emaqilNhan: UserModer(dataUser).email,
                          
                          chale:
                              '${userController.loggedInUser.email} to ${UserModer(dataUser).email}'));
                    },
                  );
                },
              );
            },
          ),
        ),
        bottomSheet: bootomSheet(),
      ),
    );
  }

  AppBar appBar(String id) {
    var model = UserModer(dataUser);
    return WowAppBar(
      color: TBTColor.black1F2A,
      titleWidget: Row(
        children: [
          Avatar(name: model.avatar),
          const SizedBox(width: 8),
          WowText.title(model.name),
        ],
      ),
      actions: [
        CircleIconButton(
          iconData: Icons.phone,
          onPressh: () {
            controller.message =
                '${userController.loggedInUser.email} to ${model.email}';
            controller.sendCall();
            MyApp.to(IndexPage(
              dataUser,
                id: id,
                emaqilNhan: model.email,
                chale:
                    '${userController.loggedInUser.email} to ${model.email}'));
          },
        ),
        const SizedBox(width: 8),
        CircleIconButton(
          iconData: Icons.videocam,
          onPressh: () => MyApp.dangPhatTrien(),
        ),
        const SizedBox(width: 8),
        CircleIconButton(
          iconData: Icons.info,
          onPressh: () => MyApp.dangPhatTrien(),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget bootomSheet() {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          const SizedBox(width: 16),
          iconTap(
            Icons.widgets_outlined,
            ontap: () => MyApp.dangPhatTrien(),
          ),
          const SizedBox(width: 8),
          iconTap(
            Icons.camera_enhance,
            ontap: () {
              controller.sendCamera();
            },
          ),
          const SizedBox(width: 8),
          iconTap(
            Icons.photo,
            ontap: () {
              controller.sendHinhAnh();
            },
          ),
          const SizedBox(width: 8),
          iconTap(
            Icons.mic,
            ontap: () => MyApp.dangPhatTrien(),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TBTTextFormField(
              controller: textController,
              hintText: 'Aa',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              onChanged: (mess) {
                controller.message = mess;
              },
            ),
          ),
          const SizedBox(width: 8),
          iconTap(
            Icons.send,
            ontap: () {
              textController.clear();
              controller.sendMess();
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget iconTap(dynamic icondata, {required void Function() ontap}) {
    return InkWell(
      onTap: ontap,
      child: WowIcon(
        icondata,
        size: 24,
        color: Colors.blueAccent,
      ),
    );
  }
}
