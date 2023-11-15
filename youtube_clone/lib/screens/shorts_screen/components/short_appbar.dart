import 'package:flutter/material.dart';
import 'package:youtube_clone/common/icon.dart';

import 'package:youtube_clone/common_components/custom_appbar.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';

class ShortAppbar extends CustomAppBar {
  const ShortAppbar({super.key});

  @override
  bool get hasLeading => false;

  @override
  Color? get backgroundColor => Colors.transparent;

  @override
  List<Widget> Function(BuildContext)? get actions => (context) => [
        IconButton(
          icon: CustomIcon(
            IconAppbar.iconSearch,
            size: 22,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: CustomIcon(
            IconAppbar.iconCamera,
            size: 22,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: CustomIcon(
            IconAppbar.iconMore,
            size: 22,
          ),
          onPressed: () {},
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: super.build(context),
    );
  }
}
