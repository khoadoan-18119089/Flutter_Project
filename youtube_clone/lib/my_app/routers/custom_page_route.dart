import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget Function(BuildContext) builder;
  final AxisDirection axisDirection;
  CustomPageRoute({
    required this.builder,
    super.settings,
    this.axisDirection = AxisDirection.up,
  }) : super(
          pageBuilder: (context, __, ___) => builder.call(context),
          transitionDuration: const Duration(seconds: 1),
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const end = Offset.zero;
    const curve = Curves.ease;
    return SlideTransition(
      position: Tween<Offset>(
        begin: getBeginOffset(),
        end: end,
      ).chain(CurveTween(curve: curve)).animate(animation),
      child: child,
    );
  }

  Offset getBeginOffset () {
    switch (axisDirection) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.left:
        return const Offset(1, 0);
      case AxisDirection.right:
        return const Offset(-1, 0);
    }
  }
}
