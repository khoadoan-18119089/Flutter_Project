import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:youtube_clone/common/enum.dart';
import 'package:youtube_clone/common/icon.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/common_components/video/animation.dart';
import 'package:youtube_clone/screens/trang_chu/controllers/video_trang_chu_controller.dart';

class SubtitleWidget extends StatefulWidget {
  const SubtitleWidget(this.controller, {super.key});
  final VideoTrangChuController controller;

  @override
  AnimationState<SubtitleWidget> createState() => _SubtitleWidgetState();
}

class _SubtitleWidgetState extends AnimationState<SubtitleWidget> {
  VideoTrangChuController get _controller => widget.controller;

  void _showToast({required String msg}) => Fluttertoast.showToast(
        msg: msg,
        backgroundColor: _toastBackground,
        fontSize: 18,
        textColor: Theme.of(context).scaffoldBackgroundColor,
      );
  Color get _toastBackground {
    Color color = Theme.of(context).scaffoldBackgroundColor;
    if (color == Colors.white) {
      return Colors.black;
    }
    return Colors.white;
  }

  void _suTitleOnOff() {
    Fluttertoast.cancel();
    setState(_controller.subtitleOnOff);
    animation.forward();
    String msg = '';
    switch (_controller.typeSubtitle) {
      case Subtitle.on:
        msg = 'Đã bật phụ đề(Tiếng Việt(đã tạo tự động))';
        break;
      case Subtitle.off:
        msg = 'Đã tắt phụ đề';
        break;
    }
    _showToast(msg: msg);
  }

  @override
  void Function()? get onTap => _suTitleOnOff;

  String get _getImageIcon {      
    switch (_controller.typeSubtitle) { 
      case Subtitle.on:    
        return IconVideo.iconSubtitleOn;
      case Subtitle.off:  
        return IconVideo.iconSubtitleOff;  
    }   
  } 

  @override  
  Widget buildWidget(  context) { 
    return CustomIcon(    
      _getImageIcon,
      size: 20,     
      color: Colors.white,   
    );      
     
  }     
}
   