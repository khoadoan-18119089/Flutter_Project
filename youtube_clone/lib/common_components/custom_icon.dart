import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
    this.iconData, {
    super.key,
    this.size,
    this.color,
  }) : _isLogo = false;

  ///Tạo một Icon Logo truyền iconData là String là hình ảnh từ asset bundle.
  const CustomIcon.logo(
    this.iconData, {
    super.key,
    this.size,
  })  : _isLogo = true,
        color = null;

  ///iconData là IconData Tạo một Icon.
  ///iconData là String tạo một Icon tìm nạp hình ảnh từ asset bundle.
  ///iconData là [File] tạo một Icon giải mã [File] dưới dạng hình ảnh.
  ///iconData là [Uint8List] tạo một Icon giải mã bộ đệm [Uint8List] dưới dạng hình ảnh.
  ///iconData là URL tạo một Icon tìm nạp hình ảnh tại URL đã cho.
  final dynamic iconData;

  final bool _isLogo;

  ///Kích thước của biểu tượng tính bằng pixel logic.
  ///Các biểu tượng chiếm một hình vuông có chiều rộng và chiều cao bằng kích thước.
  final double? size;

  ///Màu sắc sử dụng khi vẽ biểu tượng.
  ///Mặc định là [IconThemeData.color] của [IconTheme] gần nhất.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    IconThemeData icon = Theme.of(context).iconTheme;
    if (_isLogo) {
      return Image.asset(
        iconData,
        height: size ?? icon.size,
      );
    }
    if (iconData is IconData) {
      return Icon(
        iconData,
        size: size ?? icon.size,
        color: color ?? icon.color,
      );
    }
    if (iconData is Uint8List) {
      return ImageIcon(
        MemoryImage(iconData),
        size: size ?? icon.size,
        color: color ?? icon.color,
      );
    }
    if (iconData is File) {
      return ImageIcon(
        FileImage(iconData),
        size: size ?? icon.size,
        color: color ?? icon.color,
      );
    }
    if (iconData is String) {
      if (iconData.startsWith('http')) {
        return ImageIcon(
          NetworkImage(iconData),
          size: size ?? icon.size,
          color: color ?? icon.color,
        );
      }
      if (iconData.startsWith('assets')) {
        return ImageIcon(
          AssetImage(iconData),
          size: size ?? icon.size,
          color: color ?? icon.color,
        );
      }
    }
    return const SizedBox.shrink();
  }
}
