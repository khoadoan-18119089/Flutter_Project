import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wow_views/common/color.dart';
import 'package:wow_views/components/wow_text.dart';

class MyAppNotification {
  MyAppNotification._();

  static bool _isDisplay = false;

  static dangPhatTrien([String? message]) {
    snackBar(
      title: 'Thông báo',
      message: message ?? 'Chức năng đang phát triển',
    );
  }

  static snackBar({
    String? title,
    required String message,
  }) {
    if (_isDisplay) return;
    _isDisplay = true;
    Get.rawSnackbar(
      titleText: title != null
          ? WowText.listItem(
              title,
              fontWeight: FontWeight.w600,
              color: TBTColor.pink4667,
            )
          : null,
      messageText: WowText.body(
        message,
        fontWeight: FontWeight.w400,
        color: TBTColor.pink4667,
      ),
      backgroundColor: TBTColor.greyF5F6.withOpacity(0.9),
      snackPosition: SnackPosition.TOP,
      borderRadius: 15,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      duration: const Duration(seconds: 3),
      snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSED) {
          _isDisplay = false;
        }
      },
    );
  }
}
