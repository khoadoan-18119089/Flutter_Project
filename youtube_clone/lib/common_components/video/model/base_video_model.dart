import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import 'package:youtube_clone/common/extention.dart';
import 'package:youtube_clone/common/field_name.dart';
import 'package:youtube_clone/common/methods.dart';
import 'package:youtube_clone/common_components/base_widget/base_model.dart';

class BaseVideoModel extends BaseModel with ChangeNotifier {
  BaseVideoModel(super.data);

  String get nameVideo => Methods.getString(data, fieldNameVideo);

  Uri get uriVideo => Methods.getUri(data, fieldUrlVideo);

  String get thumbalVideo => Methods.getString(data, fieldThumbalVideo);

  String get view => Methods.getInt(data, fieldViewVideo).short;

  String get createAgo => Methods.timeAgoString(
      Methods.getDateTime(data, fieldCreateVideo) ?? DateTime.now());

  String get duration =>
      (Methods.getDuration(data, fieldDuration) ?? const Duration()).getTime;

  bool get playVideo =>
      Methods.getBool(data, fieldPlayVideo, defaultValue: true);

  set playVideo(bool play) {
    if (playVideo != play) {
      data.addAll({fieldPlayVideo: play});
      notifyListeners();
      if (play) {
        Wakelock.enable();
      } else {
        Wakelock.disable();
      }
    }
  }

  bool get isPlaying => Methods.getBool(data, fieldIsPlay);

  set isPlaying(bool play) {
    if (isPlaying != play) {
      data.addAll({fieldIsPlay: play});
      notifyListeners();
      if (play) {
        Wakelock.enable();
      } else {
        Wakelock.disable();
      }
    }
  }

  bool get isFullScreen => Methods.getBool(data, fieldisFullScreen);

  set isFullScreen(bool fullScreen) {
    if (isFullScreen != fullScreen) {
      data.addAll({fieldisFullScreen: fullScreen});
      notifyListeners();
    }
  }
}
