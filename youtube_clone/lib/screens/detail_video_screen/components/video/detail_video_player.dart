import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import 'package:youtube_clone/common/enum.dart';
import 'package:youtube_clone/common_components/video/button_video_widget.dart';
import 'package:youtube_clone/common_components/video/full_screen_button.dart';
import 'package:youtube_clone/common_components/video/timer_widget.dart';
import 'package:youtube_clone/common_components/video/video_player_state.dart';
import 'package:youtube_clone/models/video_model.dart';
import 'package:youtube_clone/screens/detail_video_screen/components/video/tua_video_widget.dart';
import 'package:youtube_clone/screens/detail_video_screen/controller/video_detail_controller.dart';

class DetailVideoPlayer extends StatefulWidget {
  const DetailVideoPlayer(this.model, {super.key});

  final VideoModel model;

  @override
  VideoPlayerState createState() => _DetailVideoPlayerState();
}

class _DetailVideoPlayerState
    extends VideoPlayerState<DetailVideoPlayer, VideoDetailController>
    with SingleTickerProviderStateMixin {
  VideoModel get _model => widget.model;

  late AnimationController _animation;

  double get padding => (MediaQuery.of(context).size.width / 2) - 100;

  @override
  void initVideo() {
    _animation = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    Wakelock.enable();
    videoController = VideoDetailController(_model);
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  void Function()? get onTap => _animation.forward;

  @override
  List<Widget> get componentsVideo => [
        _tuaVideo(),
        _backVideo(),
        _playPauseBuilder(),
        _nextVideo(),
        _timer(),
        _fullScreen(),
      ];

  Widget _tuaVideo() {
    return Positioned.fill(
      child: Row(
        children: [
          TuaVideoWidget(
            videoController,
            type: TuaVIdeo.rewind,
            onTap: onTap,
          ),
          TuaVideoWidget(
            videoController,
            type: TuaVIdeo.forward,
            onTap: onTap,
          ),
        ],
      ),
    );
  }

  Widget _playPauseBuilder() {
    return Align(
        alignment: Alignment.center,
        child: ButtonVideoWidget.playpause(
          _model,
          animationController: _animation,
          onTap: () => _animation.status != AnimationStatus.dismissed
              ? videoController.playPause()
              : null,
        ));
  }

  Widget _backVideo() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: padding),
        child: ButtonVideoWidget.backVideo(
          animationController: _animation,
        ),
      ),
    );
  }

  Widget _nextVideo() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: padding),
        child: ButtonVideoWidget.nextVideo(
          animationController: _animation,
        ),
      ),
    );
  }

  Widget _timer() {
    return Positioned(
      left: 8,
      bottom: 16,
      child: TimerWidget.positionTimer(
        videoController,
        animationController: _animation,
      ),
    );
  }

  @override
  Widget builtIndicator({AnimationController? animationController}) {
    return super.builtIndicator(animationController: _animation);
  }

  Widget _fullScreen() {
    return Positioned(
      right: 8,
      bottom: 16,
      child: FullScreenButtonWidget(
        _model,
        animationController: _animation,
        onTap: videoController.fullScreen,
      ),
    );
  }
}
