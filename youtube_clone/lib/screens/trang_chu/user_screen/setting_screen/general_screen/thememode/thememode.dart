import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/my_app/controllers/theme_controller/theme_controller.dart';
import 'package:youtube_clone/screens/trang_chu/user_screen/setting_screen/general_screen/list_title_general.dart';
import 'package:youtube_clone/common_components/dialog_radio.dart';

class Thememode extends StatelessWidget {
  const Thememode({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (_,baseController,__) {
        return GeneralListTitle(
          title: 'Giao diện',
          subtitle: 'Chọn giao diện sáng hoặc tối',
          show: (title) => DialogRadio<ThemeMode>(
            title: title,
            values: const [
              ThemeMode.system,
              ThemeMode.light,
              ThemeMode.dark,
            ],
            texts: const [
              'Dùng giao diện của thiết bị',
              'Giao diện sáng',
              'Giao diện tối',
            ],
            groupValue: baseController.themeMode,
            onChanged: baseController.changeThemeData,
          ),
        );
      }
    );
  }
}
