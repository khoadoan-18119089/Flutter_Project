import 'package:flutter/material.dart';
import 'package:youtube_clone/common/icon.dart';
import 'package:youtube_clone/common_components/bottomsheet_custtom/bottomsheet_item.dart';
import 'package:youtube_clone/common_components/bottomsheet_custtom/custtom_bottomsheet.dart';

class SuportBottomsheet extends CustomBottomsheet {
  const SuportBottomsheet({super.key});

  @override
  Widget header(BuildContext context) {
    return iconClose(context);
  }

  @override
  List<BottomsheetItem> items(BuildContext context) => [
        BottomsheetItem(
          titleText: 'Tạo video ngắn',
          icon: IconNavigationBar.iconShort,
        ),
        BottomsheetItem(
          titleText: 'Tải video lên',
          icon: IconNavigationBar.iconShort,
        ),
        BottomsheetItem(
          titleText: 'Phát trực tiếp',
          icon: IconNavigationBar.iconShort,
        ),
        BottomsheetItem(
          titleText: 'Tạo bài đăng',
          icon: IconNavigationBar.iconShort,
        ),
      ];
}
