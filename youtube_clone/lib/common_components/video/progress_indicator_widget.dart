import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/common_components/video/animation.dart';
import 'package:youtube_clone/common_components/video/controller/video_controller.dart';

class ProgressIndicatorWisget extends StatefulWidget {
  const ProgressIndicatorWisget(
    this.controller, {
    super.key,
    this.animationController,
    this.colors,
  });

  final AnimationController? animationController;
  final VideoController controller;

  final VideoProgressColors? colors;

  @override
  AnimationState<ProgressIndicatorWisget> createState() =>
      _ProgressIndicatorWisgetState();
}

class _ProgressIndicatorWisgetState
    extends AnimationState<ProgressIndicatorWisget> {
  VideoController get _controller => widget.controller;

  @override
  bool get isShowFirst => false;

  @override
  AnimationController? get animationController => widget.animationController;

  VideoProgressColors get _colors =>
      widget.colors ?? const VideoProgressColors();

  double get _value {
    double value = _controller.position.inMilliseconds /
        _controller.duration.inMilliseconds;
    if (value.isNaN) return 0;
    if (value < 0) return 0;
    if (value > 1) return 1;
    return value;
  }

  @override
  void initState() {
    _controller.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    _controller.addListener(update);
    super.dispose();
  }

  void update() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void Function()? get onTap => animation.forward;

  void _seekTo(double value) {
    animation.forward();
    double touchedPosition = value * _controller.duration.inMilliseconds;
    _controller.seekTo(Duration(milliseconds: touchedPosition.toInt()));
  }

  @override
  Widget animated(Animation<double> animation) {
    double radius = animation.value > 0 ? 6.0 : 2.0;
    return SizedBox(
      height: 2,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          LinearProgressIndicator(
            value: _controller.bufferedValue,
            backgroundColor: _colors.backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(_colors.bufferedColor),
          ),
          SliderTheme(
            data: Theme.of(context).sliderTheme.copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: radius),
                  trackShape: const RectangularSliderTrackShape(),
                  inactiveTrackColor: Colors.transparent,
                  activeTrackColor: _colors.playedColor,
                  thumbColor: _colors.playedColor,
                ),
            child: buildWidget(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Slider(
      value: _value,
      onChanged: _controller.allowScrubbing ? _seekTo : null,
    );
  }
}
