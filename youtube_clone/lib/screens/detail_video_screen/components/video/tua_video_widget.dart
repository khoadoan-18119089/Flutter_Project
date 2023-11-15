import 'package:flutter/material.dart';
import 'package:youtube_clone/common/enum.dart';
import 'package:youtube_clone/common/icon.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/common_components/video/animation.dart';
import 'package:youtube_clone/screens/detail_video_screen/controller/video_detail_controller.dart';

class TuaVideoWidget extends StatefulWidget {
  const TuaVideoWidget(
    this.controller, {
    super.key,
    required this.type,
    this.onTap,
  });
  final VideoDetailController controller;
  final TuaVIdeo type;
  final void Function()? onTap;

  @override
  AnimationState<TuaVideoWidget> createState() => _TuaVideoWidgetState();
}

class _TuaVideoWidgetState extends AnimationState<TuaVideoWidget> {
  VideoDetailController get _controller => widget.controller;

  TuaVIdeo get _type => widget.type;

  @override
  bool get isShowFirst => false;

  @override
  double get timerShow => 0.5;

  @override
  void Function()? get onTap => widget.onTap;

  @override
  void Function()? get onDoubleTap => () {
        animation.forward();
        switch (_type) {
          case TuaVIdeo.forward:
            return _controller.forward();
          case TuaVIdeo.rewind:
            return _controller.rewind();
        }
      };

  double opacity({required double value, required int index}) {
    value = (value - (index / 3)) * 3;
    if (value < 0) return 0;
    if (value > 1) return 1;
    return value;
  }

  String get _iconData {
    switch (_type) {
      case TuaVIdeo.forward:
        return IconVideo.iconArrowRight;
      case TuaVIdeo.rewind:
        return IconVideo.iconArrowLeft;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: super.build(context),
    );
  }

  @override
  Widget animated(Animation<double> animation) {
    return ClipPath(
      clipper: MyClipper(_type),
      child: ColoredBox(
        color: Colors.grey
            .withOpacity(animation.value > 0.5 ? 0.5 : animation.value),
        child: SizedBox.expand(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Opacity(
                opacity: opacity(value: animation.value, index: index),
                child: buildWidget(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    return CustomIcon(
      _iconData,
      size: 16,
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  MyClipper(this.type);

  final TuaVIdeo type;
  @override
  Path getClip(Size size) {
    switch (type) {
      case TuaVIdeo.forward:
        return left(size);
      case TuaVIdeo.rewind:
        return right(size);
    }
  }

  Path left(Size size) {
    var path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(50, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 50);
    path.lineTo(0, 50);
    path.quadraticBezierTo(0, 0, 50, 0);
    path.close();
    return path;
  }

  Path right(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - 50, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 50);
    path.lineTo(size.width, size.height - 50);
    path.quadraticBezierTo(
        size.width, size.height, size.width - 50, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
