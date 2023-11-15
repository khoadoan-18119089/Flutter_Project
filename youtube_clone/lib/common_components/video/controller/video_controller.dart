import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/common/enum.dart';
import 'package:youtube_clone/common_components/video/model/base_video_model.dart';

class VideoController {
  VideoController(
    this._model, {
    this.isLoop = false,
    this.autoPlay = false,
    this.timeReview,
    this.allowScrubbing = true,
    this.volumetype,
    this.volumeVaule = 0.0,
    this.subtitleType,
  }) {
    initVideoController().whenComplete(() {
      if (autoPlay) play();
    });
  }
  final BaseVideoModel _model;
  final bool isLoop;
  final bool autoPlay;
  final Duration? timeReview;
  final bool allowScrubbing;
  final Volume? volumetype;
  final Subtitle? subtitleType;

  /// 0 -> 100
  final double volumeVaule;

  late VideoPlayerController _con;
  VideoPlayerController get con => _con;

  Future<void> initVideoController() async {
    _con = VideoPlayerController.networkUrl(_model.uriVideo);
    await con.setLooping(isLoop);
  }

  Future<void> initialize() => con.initialize();

  void dispose() async => await con.dispose();

  BaseVideoModel get model => _model;
  String get thumbalVideo => _model.thumbalVideo;
  VideoPlayerValue get value => con.value;
  Duration get position => value.position;
  Duration get duration => value.duration;
  bool get isInitialized => value.isInitialized;
  List<DurationRange> get bufferedRanges => value.buffered;
  double get aspectRatio => value.aspectRatio;
  Size get size => value.size;

  void play() async => await con.play();

  void pause() async => await con.pause();

  void seekTo(Duration position) async => await con.seekTo(position);

  void checkVideo(void Function()? fn) {
    if (value.isInitialized &&
        value.isPlaying &&
        timeReview != null &&
        position.inSeconds == timeReview!.inSeconds) {
      fn?.call();
    }

    /// end video
    if (value.isInitialized && !value.isPlaying && position == duration) {
      fn?.call();
    }
  }

  Duration get getTimer => duration - position;

  late double _bufferedValue = 0.0;
  double get bufferedValue {
    if (bufferedRanges.isNotEmpty) {
      final DurationRange lastBufferedRange = bufferedRanges.last;
      final Duration bufferedUntil = lastBufferedRange.end;
      _bufferedValue = bufferedUntil.inMilliseconds / duration.inMilliseconds;
    }
    return _bufferedValue;
  }

  void addListener(void Function() listener) => con.addListener(listener);

  void removeListener(void Function() listener) => con.removeListener(listener);

  bool get playVideo => _model.playVideo;

  void playPause() async {
    if (playVideo) {
      pause();
      _model.playVideo = false;
    } else {
      play();
      _model.playVideo = true;
    }
  }

  bool get isFull => _model.isFullScreen;

  void fullScreen() {
    _model.isFullScreen = !isFull;
  }
}
