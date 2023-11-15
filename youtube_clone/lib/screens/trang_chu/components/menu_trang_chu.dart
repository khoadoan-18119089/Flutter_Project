import 'package:flutter/material.dart';
import 'package:youtube_clone/common/icon.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/common_components/custom_text.dart';

class MenuTrangChu extends StatelessWidget {
  const MenuTrangChu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 80,
            child: DrawerHeader(child: _header()),
          ),
          _itemMenu(context, title: 'Thịnh hành'),
          _itemMenu(context, title: 'Âm nhạc'),
          _itemMenu(context, title: 'Trò chơi'),
          _itemMenu(context, title: 'Tin tức'),
          _itemMenu(context, title: 'Thể thao'),
        ],
      ),
    );
  }

  Widget _header() {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIcon.logo(
            IconLogo.iconYoutube,
            size: 32,
          ),
          const SizedBox(width: 4),
          const CustomText.titleLarge('YouTube'),
        ],
      ),
    );
  }

  Widget _itemMenu(
    BuildContext context, {
    required String title,
  }) {
    return ListTile(
      title: CustomText.bodyLarge(title),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
