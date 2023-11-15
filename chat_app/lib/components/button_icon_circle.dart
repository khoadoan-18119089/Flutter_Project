import 'package:chat_app/controllers/messager_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wow_views/common/color.dart';
import 'package:wowit/widgets/wow_icon.dart';

class ButtonIconCircle extends StatelessWidget {
  const ButtonIconCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessagerIconController());
    return Opacity(
      opacity: 0.6,
      child: InkWell(
        onTap: () {
          controller.fileName = '';
          controller.filePath = '';
          Get.back();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: TBTColor.greyA4AF,
          ),
          padding: const EdgeInsets.all(4),
          child: const WowIcon(
            Icons.arrow_back_ios_new_outlined,
            color: TBTColor.whiteFFFF,
            size: 24,
          ),
        ),
      ),
    );
  }
}
