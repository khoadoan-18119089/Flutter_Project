import 'dart:io';

import 'package:chat_app/components/gradient_widget.dart';
import 'package:chat_app/controllers/messager_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MessageIcon extends StatelessWidget {
  const MessageIcon({Key? key, this.onTap, required this.screen}) : super(key: key);

  final void Function(MessagerIconController)? onTap;
  final String screen;

  @override
  Widget build(BuildContext context) {
    Get.put(MessagerIconController());
    return GetBuilder<MessagerIconController>(
        id: 'MesagerIcon-$screen',
        builder: (controller) {
          return GestureDetector(
            onTap: () => onTap!(controller),
            child: Hero(
              tag: 'messageLogo',
              child: controller.fileName == ''
                  ? SizedBox(
                      child: GradientWidget(
                        colors: const [
                          Color(0xFF178bff),
                          Color(0xFF9d37fe),
                          Color(0xFFff616d),
                        ],
                        child: Icon(
                          FontAwesomeIcons.facebookMessenger,
                          size: Get.width / 1.5,
                        ),
                      ),
                    )
                  : Container(
                    clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Get.width / 1.5,
                        ),
                      ),
                      child: Image.file(
                        File(controller.filePath),
                        width: Get.width / 1.5,
                        height: Get.width / 1.5,
                        fit: BoxFit.cover
                        ,
                      ),
                    ),
            ),
          );
        });
  }
}
