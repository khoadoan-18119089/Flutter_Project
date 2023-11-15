import 'package:flutter/material.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/common_components/custom_text.dart';

class BottomsheetItem extends ListTile {
  BottomsheetItem({
    super.key,
    required this.titleText,
    required this.icon,
    this.onPress,
  }) : super(
          leading: CustomIcon(icon),
          title: CustomText.bodyMedium(titleText),
          onTap: onPress,
        );
  final String titleText;

  final String icon;

  final void Function()? onPress;
}