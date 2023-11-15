import 'package:flutter/material.dart';

abstract class AnimationState<T extends StatefulWidget> extends State<T>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;

  AnimationController? animationController;

  late AnimationController animation;

  EdgeInsetsGeometry? padding;

  /// timerShow => seconds
  double get timerShow => 2;

  bool get isShowFirst => true;

  @override
  void initState() {
    super.initState();
    animation = animationController ??
        AnimationController(
          duration: Duration(
              seconds: timerShow.toInt(),
              milliseconds: ((timerShow - timerShow.toInt()) * 1000).toInt()),
          vsync: this,
        );
    _animation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    );
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      }
    });
    if (isShowFirst) animation.forward();
  }

  @override
  void dispose() {
    if (animationController == null) animation.dispose();
    super.dispose();
  }

  void Function()? onTap;

  void Function()? onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: animationWidget(),
    );
  }

  Widget animationWidget() {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        return animated(_animation);
      },
    );
  }

  Widget animated(Animation<double> animation) {
    double opacity = _animation.value;
    if (opacity > 0.6) {
      opacity = 0.6;
    }
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black.withOpacity(opacity),
      ),
      child: buildWidget(context),
    );
  }

  Widget buildWidget(BuildContext context);
}
