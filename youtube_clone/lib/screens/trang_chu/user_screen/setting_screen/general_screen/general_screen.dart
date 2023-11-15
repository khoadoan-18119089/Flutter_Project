import 'package:flutter/material.dart';
import 'package:youtube_clone/screens/trang_chu/user_screen/setting_screen/general_screen/bedtime/bedtime.dart';
import 'package:youtube_clone/screens/trang_chu/user_screen/setting_screen/general_screen/break/break.dart';
import 'package:youtube_clone/screens/trang_chu/user_screen/setting_screen/general_screen/thememode/thememode.dart';
import 'package:youtube_clone/common_components/custom_text.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const CustomText('Chung'),
      ),
      body: ListView(
        children: const [
          Break(),
          Bedtime(),
          Thememode(),
        ],
      ),
    );
  }
}
