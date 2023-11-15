import 'package:flutter/material.dart';
import 'package:youtube_clone/common/enum.dart';
import 'package:youtube_clone/common/icon.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/common_components/video/animation.dart';

class NextBackVideoWidget extends StatefulWidget {
  const NextBackVideoWidget({
    super.key,
    required this.type,
  });

  final NextBackVideo type;

  @override
  State<NextBackVideoWidget> createState() => _NextBackVideoWidgetState();
}

class _NextBackVideoWidgetState extends AnimationState<NextBackVideoWidget> {
  String get _iconData {
    switch (widget.type) {
      case NextBackVideo.next:
        return IconVideo.iconNextVideo;
      case NextBackVideo.back:
        return IconVideo.iconNextVideo;
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return CustomIcon(
      _iconData,
      size: 24,
    );
  }
}
