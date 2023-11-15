import 'package:chat_app/components/tbt_button.dart';
import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/model/mess_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wow_views/common/color.dart';
import 'package:wow_views/components/wow_text.dart';
import 'package:wowit/widgets/wow_image.dart';

class MessCard extends StatelessWidget {
  MessCard(this.data, {Key? key, required this.dataUser,this.onTap})
      : model = MessModel(data),
        super(key: key);
  final Map<String, Object?> data;
  final Map<String, Object?> dataUser;
  final MessModel model;
  final void Function()? onTap;
  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: WowText.body(model.timer, fontWeight: FontWeight.w600)),
        Flexible(
          child: Row(
            mainAxisAlignment:
                controller.loggedInUser.email == model.emailNguoiGui
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: controller.loggedInUser.email == model.emailNguoiGui
                        ? Colors.blueAccent
                        : TBTColor.greyA4AF,
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: card(model.type))),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget card(String type) {
    Widget? tab;
    switch (type) {
      case 'text':
        tab = WowText.listItem(
          model.mess,
          color: controller.loggedInUser.email == model.emailNguoiGui
              ? TBTColor.whiteFFFF
              : TBTColor.black1F2A,
          maxLines: null,
        );
        break;
      case 'image':
        tab = WowImage.url(
          model.mess,
          boxFit: BoxFit.contain,
          width: Get.width / 1.5,
        );
        break;
      case 'call':
        tab = SizedBox(
          width: Get.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: WowText.listItem(
                  'Bạn cuộc gọi từ ${model.emailNguoiGui}',
                  fontWeight: FontWeight.w600,
                  color: controller.loggedInUser.email == model.emailNguoiGui
                      ? TBTColor.whiteFFFF
                      : TBTColor.black1F2A,
                ),
                subtitle: WowText.caption(
                  model.timer,
                  color: controller.loggedInUser.email == model.emailNguoiGui
                      ? TBTColor.whiteFFFF
                      : TBTColor.black1F2A,
                ),
              ),
              TBTButton.elevated(
                text: 'Gọi lại',
                isExpand: true,
                backgroundColor:
                    controller.loggedInUser.email == model.emailNguoiGui
                        ? TBTColor.greyCED9
                        : Colors.blueAccent,
                onPressed: onTap,
              )
            ],
          ),
        );
        break;
    }
    return tab ?? const SizedBox.shrink();
  }
}
