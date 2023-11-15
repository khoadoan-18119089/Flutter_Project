import 'package:flutter/material.dart';
import 'package:youtube_clone/common/icon.dart';
import 'package:youtube_clone/common_components/bottomsheet_custtom/bottomsheet_item.dart';
import 'package:youtube_clone/common_components/bottomsheet_custtom/custtom_bottomsheet.dart';

class VideoBottomsheet extends CustomBottomsheet {
  const VideoBottomsheet({super.key});

  @override
  Widget header(BuildContext context) {
    return rod();
  }

  @override
  List<BottomsheetItem> items(BuildContext context) => [
        BottomsheetItem(
          titleText: 'Phát tiếp theo trong danh sách chờ',
          icon: IconNavigationBar.iconHome,
        ),
        BottomsheetItem(
          titleText: 'Lưu vào danh sách Xem sau',
          icon: IconNavigationBar.iconHome,
        ),
        BottomsheetItem(
          titleText: 'Lưu vào danh sách phát',
          icon: IconNavigationBar.iconHome,
        ),
        BottomsheetItem(
          titleText: 'Chia sẻ',
          icon: IconNavigationBar.iconHome,
        ),
        BottomsheetItem(
          titleText: 'Không quan tâm',
          icon: IconNavigationBar.iconHome,
        ),
        BottomsheetItem(
          titleText: 'Không đề xuất kênh này',
          icon: IconNavigationBar.iconHome,
        ),
        BottomsheetItem(
          titleText: 'Báo vi phạm',
          icon: IconNavigationBar.iconHome,
        ),
      ];
}
