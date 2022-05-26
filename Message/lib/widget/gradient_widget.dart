import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GradientWidget extends StatelessWidget {
  final Widget child;
  final List<Color> colors;
  AlignmentGeometry begin, end;
  GradientWidget({
    required this.child,
    required this.colors,
    this.begin = Alignment.topRight,
    this.end = Alignment.bottomLeft,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) => LinearGradient(
        begin: begin,
        end: end,
        colors: colors,
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
