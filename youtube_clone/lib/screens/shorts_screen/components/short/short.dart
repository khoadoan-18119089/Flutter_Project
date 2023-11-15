import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import 'package:youtube_clone/common_components/custom_button.dart';
import 'package:youtube_clone/common_components/custom_listener.dart';
import 'package:youtube_clone/common_components/custom_text.dart';
import 'package:youtube_clone/models/short_model.dart';
import 'package:youtube_clone/screens/shorts_screen/components/short/short_player.dart';

class Short extends StatelessWidget {
  const Short(this.model, {super.key});

  final ShortModel model;

  void wakeLock() async {
    if (model.isPlaying) {
      await Wakelock.enable();
    } else {
      await Wakelock.disable();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomListener2<ShortModel, bool>(
          model: model,
          value: model.isPlaying,
          builder: (model) {
            wakeLock();
            return model.isPlaying ? ShortPlayer(model) : _thumbal();
          },
        ),
        _inforShort(),
      ],
    );
  }

  Widget _thumbal() {
    return Image.network(
      model.thumbalVideo,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _avataChanel() {
    return CircleAvatar(
      maxRadius: 16,
      backgroundImage: NetworkImage(model.chanel.imgChanel),
    );
  }

  Widget _nameChanel() {
    return CustomText.bodyMedium(model.chanel.nameChanel);
  }

  Widget _buttonDangKy() {
    return CustomButton.elevated(
      onPressed: () {},
      text: 'Đăng ký',
      backgroundColor: Colors.white,
      textColor: Colors.black,
    );
  }

  Widget _header() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _avataChanel(),
        const SizedBox(width: 2),
        _nameChanel(),
        const SizedBox(width: 2),
        _buttonDangKy(),
      ],
    );
  }

  Widget _nameShort() {
    return CustomText.bodySmall(
      model.nameVideo,
      maxLines: 2,
    );
  }

  Widget _inforShort() {
    return Positioned(
      bottom: 40,
      left: 16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          const SizedBox(height: 8),
          _nameShort(),
        ],
      ),
    );
  }
}
