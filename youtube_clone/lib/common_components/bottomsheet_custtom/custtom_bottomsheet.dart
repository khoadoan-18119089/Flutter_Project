import 'package:flutter/material.dart';
import 'package:youtube_clone/common_components/bottomsheet_custtom/bottomsheet_item.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/common_components/custom_text.dart';

abstract class CustomBottomsheet extends StatelessWidget {
  const CustomBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        header(context),
        const SizedBox(height: 8),
        ...items(context),
      ],
    );
  }

  Widget rod() {
    return Container(
      height: 4,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.grey.shade700,
      ),
    );
  }

  Widget iconClose(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        const CustomText.titleSmall('Tạo'),
        const Spacer(),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const CustomIcon(Icons.close),
        ),
      ],
    );
  }

  ///Có sắn 2 loại widget thanh dài rod và iconClose.
  Widget header(BuildContext context);

  ///Danh sách hiện thị trong BottomSheet.
  List<BottomsheetItem> items(BuildContext context);
}
