import 'package:chat_app/components/avatar.dart';
import 'package:flutter/widgets.dart';
import 'package:wow_views/common/color.dart';

class TBTCircleAvatar extends StatelessWidget {
  const TBTCircleAvatar({
    required this.name,
    this.circleBorderWidth = 2.0,
    this.circleBorderColor = TBTColor.blueA2B0,
    this.spacingCircleAvatar = 2,
    this.widthCircleAvatar = 80,
    Key? key,
  }) : super(key: key);

  /// Data hình ảnh
  final String name;

  /// Màu của viền CircleAvatar
  final Color circleBorderColor;

  /// Độ rộng của viền CircleAvatar
  final double circleBorderWidth;

  /// Khoảng cách của viền với Avatar
  final double spacingCircleAvatar;

  /// Chiều rộng của Avatar
  final double widthCircleAvatar;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widthCircleAvatar,
        height: widthCircleAvatar,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widthCircleAvatar),
          border: Border.all(
            color: circleBorderColor,
            width: circleBorderWidth,
          ),
        ),
        padding: EdgeInsets.all(spacingCircleAvatar),
        child: Avatar(
          name: name,
          height: widthCircleAvatar - circleBorderWidth,
        ));
  }
}
