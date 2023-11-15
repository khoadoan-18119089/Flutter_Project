import 'package:flutter/material.dart';
import 'package:youtube_clone/screens/detail_video_screen/components/detail_video.dart';

class DetailVideoScreen extends StatelessWidget {
  const DetailVideoScreen(this.id, {super.key});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: DetailVideo(id)),
    );
  }
}
