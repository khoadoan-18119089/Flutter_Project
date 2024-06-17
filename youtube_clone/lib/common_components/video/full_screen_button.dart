import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/common_components/custom_listener.dart';
import 'package:youtube_clone/common_components/video/animation.dart';
import 'package:youtube_clone/common_components/video/model/base_video_model.dart';
import 'package:youtube_clone/main.dart';
import 'package:youtube_clone/my_app/routers/views.dart';

class FullScreenButtonWidget extends StatefulWidget {
  const FullScreenButtonWidget(
    this.model, {
    super.key,
    this.animationController,
    this.onTap,
  });

  final BaseVideoModel model;

  final AnimationController? animationController;

  final Function()? onTap;

  @override
  State<FullScreenButtonWidget> createState() => _FullScreenButtonWidgetState();
}

class _FullScreenButtonWidgetState
    extends AnimationState<FullScreenButtonWidget> {
  @override
  bool get isShowFirst => false;

  @override
  AnimationController? get animationController => widget.animationController;

  @override
  void Function()? get onTap => () async {
        if (animation.status != AnimationStatus.dismissed) {
          widget.onTap?.call();
          // if (!widget.model.isFullScreen) {
          //   await SystemChrome.setPreferredOrientations([
          //     DeviceOrientation.landscapeLeft,
          //     DeviceOrientation.landscapeRight,
          //   ]);
          // } else {
          //   await SystemChrome.setPreferredOrientations(
          //       DeviceOrientation.values);
          // }
          //   if (widget.model.isFullScreen) {
          //     MyApp.back(context);
          //   } else {
          //     MyApp.to(context, Views.fullVideo, arguments: widget.model.data.map((key, value) => MapEntry(key, value.toString())));
          //   }
        }
        animation.forward();
      };

  Future<void> setLandsCape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Future<void> setAllOrientations() async {}

  @override
  Widget animated(Animation<double> animation) {
    return Opacity(
      opacity: animation.value,
      child: buildWidget(context),
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    return CustomListener2<BaseVideoModel, bool>(
      model: widget.model,
      value: widget.model.isFullScreen,
      builder: (model) {
        return CustomIcon(
          !model.isFullScreen
              ? Icons.fullscreen_outlined
              : Icons.fullscreen_exit_outlined, 
          size: 24,
          color: Colors.white,
        );  
      },  
    );
  }  
}  