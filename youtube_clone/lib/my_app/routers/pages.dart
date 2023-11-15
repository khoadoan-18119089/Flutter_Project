import 'package:flutter/material.dart';
import 'package:youtube_clone/common/field_name.dart';
import 'package:youtube_clone/common/methods.dart';
import 'package:youtube_clone/common_screens/full_screen/full_screen.dart';
import 'package:youtube_clone/common_screens/splash_screen/splash_screen.dart';
import 'package:youtube_clone/models/video_model.dart';
import 'package:youtube_clone/my_app/routers/custom_page_route.dart';
import 'package:youtube_clone/my_app/routers/routers_screens.dart';
import 'package:youtube_clone/screens/detail_video_screen/detail_video_screen.dart';
import 'package:youtube_clone/screens/home/home_screen.dart';
import 'package:youtube_clone/screens/library_screen/library_screen.dart';
import 'package:youtube_clone/screens/shorts_screen/shorts_screen.dart';
import 'package:youtube_clone/screens/subscriptions_screen/subsriptions_screen.dart';
import 'package:youtube_clone/screens/trang_chu/trang_chu_screen.dart';
import 'package:youtube_clone/screens/trang_chu/user_screen/setting_screen/general_screen/general_screen.dart';
import 'package:youtube_clone/screens/trang_chu/user_screen/setting_screen/setting_screen.dart';
import 'package:youtube_clone/screens/trang_chu/user_screen/user_screen.dart';

extension Pages on MyAppRoutes {
  Route<dynamic> unknowPage(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
              'Không có tuyến đường nào được xác định cho ${settings.name}'),
        ),
      ),
    );
  }

  Route<dynamic> splashPage(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const SplashScreen(),
    );
  }

  Route<dynamic> homePage(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const HomeScreen(),
    );
  }

  Route<dynamic> trangChuPage(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const TrangChuScreen(),
    );
  }

  Route<dynamic> shortPage(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const ShortsScreen(),
    );
  }

  Route<dynamic> subscriptionsPage(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const SubcriptionsScreen(),
    );
  }

  Route<dynamic> libraryPage(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const LibraryScreen(),
    );
  }

  Route<dynamic> userPage(RouteSettings settings) {
    return CustomPageRoute(
        settings: settings,
        builder: (_) => const UserScreen(),
        axisDirection: AxisDirection.up);
  }

  Route<dynamic> settingPage(RouteSettings settings) {
    return CustomPageRoute(
        settings: settings,
        builder: (_) => SettingScreen(),
        axisDirection: AxisDirection.left);
  }

  Route<dynamic> generalPage(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const GeneralScreen(),
    );
  }

  Route<dynamic> detailVideoPage(RouteSettings settings) {
    Map<String, String> arguments = Methods.objectToMap(settings.arguments);
    int id = Methods.getInt(arguments, fieldId);
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => DetailVideoScreen(id),
    );
  }

  Route<dynamic> fullVideoPage(RouteSettings settings) {
    Map<String, String> arguments = Methods.objectToMap(settings.arguments);
    VideoModel model = VideoModel(arguments);
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => FullScreen(model),
    );
  }
}
