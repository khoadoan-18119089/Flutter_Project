import 'package:flutter/material.dart';
import 'package:youtube_clone/common/field_name.dart';
import 'package:youtube_clone/common/methods.dart';
import 'package:youtube_clone/common_components/base_widget/base_controller.dart';
import 'package:youtube_clone/models/video_model.dart';

class DanhSachVideoController extends BaseController {
  @override
  Future<Map<String, List<Map<String, Object?>?>?>?> loadData() async {
    var data = await getDio('http://datayoutube.000webhostapp.com/videohome');
    return data;
  }

  List<VideoModel> get videos => _dsVideo;

  late ScrollController controller;

  @override
  void onReady() {
    _initDataVideos(getData);
    _initVideoPlayFirst();
    controller = ScrollController();
    controller.addListener(() => scrollChangeVideo());
    super.onReady();
  }

  @override
  void dispose() {
    controller.removeListener(scrollChangeVideo);
    super.dispose();
  }

  void scrollChangeVideo() {
    int middleElement = (controller.offset + 200) ~/ 270;
    if (middleElement >= 0 && middleElement < _dsVideo.length) {
      changeVideo(middleElement);
    }
  }

  final List<VideoModel> _dsVideo = [];

  int? _oldIndex;
  int? get oldIndex => _oldIndex;

  void _initDataVideos(Map<String, List<Map<String, Object?>?>?> data) {
    List<Map<String, Object?>> list = Methods.getList(data, tblVideo);
    _dsVideo.addAll(list.map((e) => VideoModel(e)));
  }

  void changeVideo(int? newIndex) {
    if (oldIndex != newIndex) {
      if (oldIndex != null) _dsVideo[oldIndex!].isPlaying = false;
      if (newIndex != null) _dsVideo[newIndex].isPlaying = true;
      _oldIndex = newIndex;
    }
  }

  void _initVideoPlayFirst() => changeVideo(0);

  void ontapVideo() => scrollChangeVideo();

  void disposeVideo() => changeVideo(null);
}
