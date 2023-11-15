import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/common_components/video/timer_widget.dart';
import 'package:youtube_clone/common_components/video/video_player_state.dart';
import 'package:youtube_clone/models/video_model.dart';
import 'package:youtube_clone/screens/trang_chu/components/video/subtitle_widget.dart';
import 'package:youtube_clone/screens/trang_chu/components/video/volume_widget.dart';
import 'package:youtube_clone/screens/trang_chu/controllers/danh_sach_video_controller.dart';
import 'package:youtube_clone/screens/trang_chu/controllers/video_trang_chu_controller.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer(this.model, {super.key});
  final VideoModel model;

  @override
  VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState
    extends VideoPlayerState<VideoPlayer, VideoTrangChuController> {
  VideoModel get _model => widget.model;

  @override
  void initVideo() {
    videoController = VideoTrangChuController(_model);
    videoController.addListener(checkVideo);
  }

  @override
  void dispose() {
    videoController.pause();
    videoController.removeListener(checkVideo);
    super.dispose();
  }

  void checkVideo() {
    videoController.checkVideo(disposeVideo);
  }

  void disposeVideo() {
    context.read<DanhSachVideoController>().disposeVideo();
  }

  @override
  List<Widget> get componentsVideo => [
        volume(),
        subtitle(),
        timer(),
      ];

  Widget volume() {
    return Positioned(
      top: 8,
      right: 8,
      child: VolumeWidget(videoController),
    );
  }

  Widget subtitle() {
    return Positioned(
      top: 62,
      right: 8,
      child: SubtitleWidget(videoController),
    );
  }

  Widget timer() {
    return Positioned(
      bottom: 8,
      right: 8,
      child: TimerWidget.countdownTimer(videoController),
    );
  }
}
