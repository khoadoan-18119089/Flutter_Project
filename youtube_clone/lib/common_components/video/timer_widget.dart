import 'package:flutter/material.dart';
import 'package:youtube_clone/common/extention.dart';
import 'package:youtube_clone/common_components/video/animation.dart';
import 'package:youtube_clone/common_components/video/controller/video_controller.dart';
import 'package:youtube_clone/common_components/custom_text.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget.countdownTimer(
    this.controller, {
    super.key,
  })  : isCountdown = true,
        animationController = null;

  const TimerWidget.positionTimer(
    this.controller, {
    super.key,
    this.animationController,
  }) : isCountdown = false;

  final VideoController controller;

  final bool isCountdown;

  final AnimationController? animationController;

  @override
  AnimationState<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends AnimationState<TimerWidget> {
  VideoController get _controller => widget.controller;

  @override
  bool get isShowFirst => false;

  @override
  AnimationController? get animationController => widget.animationController;

  @override
  void initState() {
    _controller.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(update);
    super.dispose();
  }

  void update() {
    if (mounted) {
      setState(() {});
    }
  }

  Widget _countdownTimer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black.withOpacity(0.45),
      ),
      child: CustomText.bodySmall(
        _controller.getTimer.getTime,
        color: Colors.white,
      ),
    );
  }

  Widget _positionTimer() {
    return CustomText.bodySmall(
        '${_controller.position.getTime} / ${_controller.duration.getTime}');
  }

  @override
  Widget animated(Animation<double> animation) {
    if (widget.isCountdown) {
      return buildWidget(context);
    } else {
      return Opacity(
        opacity: animation.value,
        child: buildWidget(context),
      );
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return widget.isCountdown ? _countdownTimer() : _positionTimer();
  }
}
