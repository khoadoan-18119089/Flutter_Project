import 'package:flutter/material.dart';
import 'package:youtube_clone/common/enum.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/common_components/video/animation.dart';
import 'package:youtube_clone/common/icon.dart';
import 'package:youtube_clone/screens/trang_chu/controllers/video_trang_chu_controller.dart';

class VolumeWidget extends StatefulWidget {
  const VolumeWidget(this.controller, {super.key});

  final VideoTrangChuController controller;

  @override
  AnimationState<VolumeWidget> createState() => _VolumeWidgetState();
}

class _VolumeWidgetState extends AnimationState<VolumeWidget> {
  VideoTrangChuController get _controller => widget.controller;

  @override
  void Function()? get onTap => () {
        animation.forward();
        setState(_controller.volumeOnOff);
      };

  String get _getImageIcon {
    switch (_controller.typeVolume) {
      case Volume.value:
      case Volume.volumeOn:
        return IconVideo.iconVolumeOn;
      case Volume.volumeOff:
        return IconVideo.iconVolumeOff;
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return CustomIcon(
      _getImageIcon,
      size: 20,
      color: Colors.white,
    );
  }
}
