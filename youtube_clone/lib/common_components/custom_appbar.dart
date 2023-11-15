import 'package:flutter/material.dart';
import 'package:youtube_clone/common/enum.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/common_components/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leading,
    this.title = '',
    this.widgetTitle,
    this.actions,
    this.hasLeading = true,
    this.typeBackBotton = TypeBackBotton.arrowBack,
    this.backgroundColor,
    this.onTapBack,
  });

  final Widget? leading;

  final String title;

  final Widget? widgetTitle;

  final List<Widget> Function(BuildContext)? actions;

  final bool hasLeading;

  final TypeBackBotton typeBackBotton;

  final Color? backgroundColor;

  final Function()? onTapBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hasLeading
          ? (leading ??
              CustomBackButton(
                type: typeBackBotton,
                onPressed: onTapBack,
              ))
          : null,
      title: widgetTitle ?? CustomText.titleLarge(title),
      actions: actions?.call(context),
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    required this.type,
    this.onPressed,
  });

  final Function? onPressed;

  final TypeBackBotton type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TypeBackBotton.arrowBack:
        return arrowBack(context);
      case TypeBackBotton.close:
        return close(context);
    }
  }

  Widget arrowBack(BuildContext context) {
    return IconButton(
      icon: const CustomIcon(Icons.arrow_back_sharp),
      tooltip: 'Dịch chuyển lên',
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.pop(context);
        }
      },
    );
  }

  Widget close(BuildContext context) {
    return IconButton(
      icon: const CustomIcon(Icons.close_sharp),
      tooltip: 'Đóng',
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.pop(context);
        }
      },
    );
  }
}
