import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/common/icon.dart';
import 'package:youtube_clone/main.dart';
import 'package:youtube_clone/my_app/controllers/theme_controller/theme_controller.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/my_app/routers/views.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _nextRoute(BuildContext context) async {
    bool isCheck = await MyApp.internet.checkConnection();
    if (isCheck) {
      if (!context.mounted) return;
      MyApp.to(context, Views.home);
    }
  }

  void _changeThemeData(BuildContext context,
      {required ThemeMode? themeMode}) async {
    await context.read<ThemeController>().changeThemeData(themeMode);
    if (!context.mounted) return;
    _nextRoute(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ThemeMode>(
      future: MyApp.setting.getThemeMode(),
      builder: (_, AsyncSnapshot<ThemeMode> snapshot) {
        double width = MediaQuery.of(context).size.width;
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {}
          ThemeMode? themeMode = snapshot.data;
          _changeThemeData(context, themeMode: themeMode);
        }
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: CustomIcon.logo(
              IconLogo.iconYoutube,
              size: width * 0.2,
            ),
          ),
        );
      },
    );
  }
}
