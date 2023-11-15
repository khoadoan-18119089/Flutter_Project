import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/common_components/video/progress_indicator_widget.dart';
import 'package:youtube_clone/common_components/video/controller/video_controller.dart';

abstract class VideoPlayerState<T extends StatefulWidget,
    Controller extends VideoController> extends State<T> {
  late Controller videoController;

  double get kDefaultHeight => 230;

  void Function()? get onTap => null;

  @override
  void initState() {
    initVideo();
    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  /// Nhập videoController
  void initVideo();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: videoController.initialize(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loading(context);
        }
        return GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              buildVideoPlayer(),
              ...componentsVideo,
              builtIndicator()
            ],
          ),
        );
      },
    );
  }

  Widget loading(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).cardColor,
      child: Container(
        height: kDefaultHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(videoController.thumbalVideo),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildVideoPlayer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AspectRatio(
        aspectRatio: videoController.aspectRatio,
        child: VideoPlayer(videoController.con),
      ),
    );
  }

  List<Widget> get componentsVideo;

  Widget builtIndicator({AnimationController? animationController}) {
    return Positioned(
      bottom: 0,
      child: ProgressIndicatorWisget(
        videoController,
        animationController: animationController,
      ),
    );
  }
}
