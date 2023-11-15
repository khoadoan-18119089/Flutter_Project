import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:chat_app/components/circle_icon_button.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/screens/video_call/controller/video_call_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wow_views/common/color.dart';
import 'package:wowit/widgets/wow_image.dart';

import './call.dart';

class IndexPage extends StatefulWidget {
  IndexPage(
    Map<String, Object?> data, {
    Key? key,
    required this.chale,
    required this.id,
    required this.emaqilNhan,
  })  : moder = UserModer(data),
        super(key: key);

  @override
  State<StatefulWidget> createState() => IndexState();
  final String chale;
  final String id;
  final String emaqilNhan;
  final UserModer moder;
}

class IndexState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Opacity(
          opacity: 0.6,
          child: FutureBuilder(
            future: MyApp.downImage(widget.moder.avatar),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                return const Scaffold(
                  body: Text('Something went wrong'),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Image.asset(
                  'assets/images/default.jpg',
                  width: Get.width,
                  height: Get.height,
                );
              }
              return WowImage.url(
                snapshot.data!.toString(),
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleIconButton(
              iconData: Icons.close,
              color: TBTColor.pink4667,
              onPressh: close,
            ),
            const SizedBox(
              width: 56,
            ),
            CircleIconButton(
              iconData: Icons.phone,
              color: Colors.blueAccent,
              onPressh: onJoin,
            ),
          ],
        ),
      ],
    ));
  }

  Future<void> onJoin() async {
    // update input validation

    // await for camera and mic permissions before pushing video page
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    // push video page with given channel name
    // ignore: use_build_context_synchronously
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CallPage(
          channelName: widget.chale,
          role: ClientRole.Broadcaster,
          emailNhan: widget.emaqilNhan,
          id: widget.id,
        ),
      ),
    );
  }

  final controller = VideoCallController();

  Future<void> close() async {
    controller.emailNhan = widget.emaqilNhan;
    controller.sendCall(widget.id);
    Get.back();
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    await permission.request();
  }
}
