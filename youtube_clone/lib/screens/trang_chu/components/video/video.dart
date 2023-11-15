import 'package:flutter/material.dart';
import 'package:youtube_clone/common/icon.dart';
import 'package:youtube_clone/common_components/custom_listener.dart';
import 'package:youtube_clone/main.dart';
import 'package:youtube_clone/models/video_model.dart';
import 'package:youtube_clone/my_app/routers/views.dart';
import 'package:youtube_clone/screens/trang_chu/components/video/video_player.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/common_components/custom_text.dart';
import 'package:youtube_clone/common_components/video_bottomsheet.dart';

class Video extends StatelessWidget {
  const Video(
    this.model, {
    super.key,
  });

  final VideoModel model;

  void _showBottonshet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => const VideoBottomsheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 8,
      onTap: () {
        model.isPlaying = false;
        MyApp.to(context, Views.detailVideo, idData: model.id);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomListener<VideoModel>(
            model: model,
            builder: (model) {
              return model.isPlaying
                  ? VideoPlayer(model)
                  : Stack(
                      children: [
                        _thumball(),
                        _timer(),
                      ],
                    );
            },
          ),
          ListTile(
            leading: _avataChanel(),
            title: _title(),
            subtitle: _subTitle(context),
            trailing: _more(context),
            visualDensity: const VisualDensity(horizontal: -4),
          )
        ],
      ),
    );
  }

  Widget _thumball() {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        child: Image.network(
          model.thumbalVideo,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _timer() {
    return Positioned(
      bottom: 8,
      right: 24,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black.withOpacity(0.45),
        ),
        child: CustomText.bodySmall(
          model.duration,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _avataChanel() {
    return CircleAvatar(
      maxRadius: 16,
      backgroundImage: NetworkImage(model.chanel.imgChanel),
    );
  }

  Widget _title() {
    return CustomText.bodySmall(
      model.nameVideo,
      maxLines: 2,
    );
  }

  Widget _subTitle(BuildContext context) {
    return CustomText.rich(
      TextSpan(
        children: [
          TextSpan(text: model.chanel.nameChanel),
          const TextSpan(text: ' • '),
          TextSpan(text: model.view),
          const TextSpan(text: ' • '),
          TextSpan(text: model.createAgo),
        ],
      ),
      maxLines: 2,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }

  Widget _more(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () => _showBottonshet(context),
      child: CustomIcon(
        IconVideo.iconMore,
        size: 12,
      ),
    );
  }
}
