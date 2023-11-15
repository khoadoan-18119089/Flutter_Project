import 'package:flutter/material.dart';
import 'package:youtube_clone/common/enum.dart';
import 'package:youtube_clone/common/icon.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/common_components/custom_listener.dart';
import 'package:youtube_clone/common_components/video/animation.dart';
import 'package:youtube_clone/common_components/video/model/base_video_model.dart';

class ButtonVideoWidget extends StatefulWidget {
  const ButtonVideoWidget.backVideo({
    super.key,
    this.animationController,
    this.size = 18,
    this.onTap,
    this.padding,
  })  : model = null,
        type = ButtonVideoIcon.backVideo;

  const ButtonVideoWidget.nextVideo({
    super.key,
    this.animationController,
    this.size = 18,
    this.onTap,
    this.padding,
  })  : model = null,
        type = ButtonVideoIcon.nextVideo;

  const ButtonVideoWidget.playpause(
    this.model, {
    super.key,
    this.animationController,
    this.size = 45,
    this.onTap,
    this.padding = const EdgeInsets.all(4),
  }) : type = ButtonVideoIcon.playPause;

  final BaseVideoModel? model;

  final ButtonVideoIcon type;

  final double size;

  final AnimationController? animationController;

  final void Function()? onTap;

  final EdgeInsetsGeometry? padding;

  @override
  State<ButtonVideoWidget> createState() => _ButtonVideoWidgetState();
}

class _ButtonVideoWidgetState extends AnimationState<ButtonVideoWidget> {
  BaseVideoModel? get _model => widget.model;

  @override
  bool get isShowFirst => false;

  @override
  AnimationController? get animationController => widget.animationController;

  @override
  EdgeInsetsGeometry? get padding => widget.padding;

  @override
  void Function()? get onTap => () {
        widget.onTap?.call(); 
        animation.forward();
        
      };

  dynamic get _iconData {
    switch (widget.type) {
      case ButtonVideoIcon.backVideo:
        return IconVideo.iconBackVideo;
      case ButtonVideoIcon.nextVideo:
        return IconVideo.iconNextVideo;
      case ButtonVideoIcon.playPause:
        return _model!.playVideo
            ? Icons.play_arrow_rounded
            : Icons.pause_rounded;
    }
  }

  Widget _buildWidget() {
    switch (widget.type) {
      case ButtonVideoIcon.backVideo:
      case ButtonVideoIcon.nextVideo:
        return _icon();
      case ButtonVideoIcon.playPause:
        return CustomListener2<BaseVideoModel, bool>(
          model: _model!,
          value: _model!.playVideo,
          builder: (_) {
            return _icon();
          },
        );
    }
  }

  @override
  Widget animated(Animation<double> animation) {
    return Opacity(
      opacity: animation.value,
      child: super.animated(animation),
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    return _buildWidget();
  }

  Widget _icon() {
    return CustomIcon(
        _iconData,
        size: widget.size,
        color: Colors.white,
      );
  }
}
