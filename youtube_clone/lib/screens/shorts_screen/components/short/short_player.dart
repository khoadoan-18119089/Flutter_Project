import 'package:flutter/material.dart';
import 'package:youtube_clone/common_components/video/button_video_widget.dart';
import 'package:youtube_clone/common_components/video/video_player_state.dart';
import 'package:youtube_clone/models/short_model.dart';
import 'package:youtube_clone/screens/shorts_screen/controller/short_controller.dart';

class ShortPlayer extends StatefulWidget {
  const ShortPlayer(this.model, {super.key});
  final ShortModel model;

  @override
  State createState() => _ShortPlayerState();
}

class _ShortPlayerState extends VideoPlayerState<ShortPlayer, ShortController>
    with SingleTickerProviderStateMixin {
  ShortModel get _model => widget.model;

  late AnimationController _animation;

  @override
  void initVideo() {
    _animation = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    videoController = ShortController(_model);
  }

  @override
  double get kDefaultHeight => double.infinity;

  @override
  void Function()? get onTap => () {
        _animation.forward();
        videoController.playPause();
      };

  @override
  List<Widget> get componentsVideo => [
        playPauseBuilder(),
      ];

  Widget playPauseBuilder() {
    return Align(
      alignment: Alignment.center,
      child: ButtonVideoWidget.playpause(
        _model,
        animationController: _animation,
        onTap: videoController.playPause,
      ),
    );
  }
}
