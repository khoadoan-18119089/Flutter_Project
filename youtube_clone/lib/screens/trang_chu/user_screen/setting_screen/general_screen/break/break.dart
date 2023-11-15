import 'package:flutter/material.dart';
import 'package:youtube_clone/screens/trang_chu/user_screen/setting_screen/general_screen/list_title_general.dart';

class Break extends StatelessWidget {
  const Break({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralListTitle(
      title: 'Nhắc tôi tạm dừng xem',
      isSwitch: true,
      show: (title) => const SizedBox(),
    );
  }
}
