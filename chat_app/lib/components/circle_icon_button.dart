import 'package:flutter/material.dart';
import 'package:wow_views/common/color.dart';
import 'package:wowit/widgets/wow_icon.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    Key? key,
    required this.iconData,
    required this.onPressh,
    this.size = 24,
    this.color = TBTColor.greyA4AF,
  }) : super(key: key);
  final IconData iconData;
  final void Function() onPressh;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.6,
      child: InkWell(
        onTap: onPressh,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: color,
          ),
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: WowIcon(
            iconData,
            color: TBTColor.black1F2A,
            size: size,
          ),
        ),
      ),
    );
  }
}
