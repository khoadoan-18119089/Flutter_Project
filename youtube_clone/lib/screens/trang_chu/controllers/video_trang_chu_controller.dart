import 'package:youtube_clone/common/enum.dart';
import 'package:youtube_clone/common_components/video/controller/video_controller.dart';
import 'package:youtube_clone/models/video_model.dart';

class VideoTrangChuController extends VideoController {
  VideoTrangChuController(this._model): super(_model);

  final VideoModel _model;

  
  @override
  bool get autoPlay => true;

  @override
  Duration? get timeReview => const Duration(minutes: 5);

  bool get isPlaying => _model.isPlaying;

  late Volume _typeVolume = volumetype ?? _model.typeVolume;
  Volume get typeVolume => _typeVolume;

  late double _volume = volumeVaule;
  double get volume => _volume;

  late Subtitle _typeSubtitle = subtitleType ?? _model.typeSubtitle;
  Subtitle get typeSubtitle => _typeSubtitle;

  @override
  Future<void> initVideoController() async {
    super.initVideoController();
    initVolume();
  }

  void initVolume() async {
    switch (typeVolume) {
      case Volume.value:
        return await con.setVolume(volume / 100);
      case Volume.volumeOn:
        return await con.setVolume(1.0);
      case Volume.volumeOff:
        return await con.setVolume(0.0);
    }
  }

  void volumeOnOff() {
    if (typeVolume == Volume.volumeOn) {
      _typeVolume = Volume.volumeOff;
    } else {
      _typeVolume = Volume.volumeOn;
    }
    _model.typeVolume = typeVolume;
    initVolume();
  }

  void subtitleOnOff() {
    switch (typeSubtitle) {
      case Subtitle.on:
        _typeSubtitle = Subtitle.off;
        break;
      case Subtitle.off:
        _typeSubtitle = Subtitle.on;
        break;
    }
    _model.typeSubtitle = typeSubtitle;
  }

  void setVolume(Volume typeVolume, {double volume = 0.0}) {
    _typeVolume = typeVolume;
    _volume = volume;
  }

  void playOrPause() => _model.isPlaying ? play() : pause();
}
