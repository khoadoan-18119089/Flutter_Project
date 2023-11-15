import 'package:flutter/material.dart';
import 'package:youtube_clone/common_components/base_widget/base_widget.dart';
import 'package:youtube_clone/screens/detail_video_screen/components/video/detail_video_player.dart';
import 'package:youtube_clone/screens/detail_video_screen/controller/detail_video_controller.dart';

class DetailVideo extends BaseWidget<DetailVideoController> {
  DetailVideo(int id, {super.key}) : super(DetailVideoController(id));

  @override
  Widget getMainView(
      BuildContext context, DetailVideoController baseController) {
    return DetailVideoPlayer(baseController.detailVideo);
  }
}
