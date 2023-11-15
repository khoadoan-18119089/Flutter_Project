import 'package:flutter/material.dart';
import 'package:youtube_clone/models/video_model.dart';
import 'package:youtube_clone/screens/detail_video_screen/components/video/detail_video_player.dart';

class FullScreen extends StatelessWidget {
  const FullScreen(this._model,{super.key});

  final VideoModel _model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: DetailVideoPlayer(_model)),
    );
  }
}
