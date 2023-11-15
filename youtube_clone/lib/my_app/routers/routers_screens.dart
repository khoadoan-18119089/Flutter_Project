import 'package:flutter/material.dart';
import 'package:youtube_clone/my_app/routers/pages.dart';
import 'package:youtube_clone/my_app/routers/views.dart';

class MyAppRoutes {
  MyAppRoutes._();
  factory MyAppRoutes() => intanse;
  static final MyAppRoutes intanse = MyAppRoutes._();

  final String routerInitial = Views.splash.path;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (Views.fromPath(settings.name)) {
      case Views.unKnow:
        return unknowPage(settings);
      case Views.splash:
        return splashPage(settings);
      case Views.home:
        return homePage(settings);
      case Views.trangChu:
        return trangChuPage(settings);
      case Views.short:
        return shortPage(settings);
      case Views.subscriptions:
        return subscriptionsPage(settings);
      case Views.library:
        return libraryPage(settings);
      case Views.user:
        return userPage(settings);
      case Views.setting:
        return settingPage(settings);
      case Views.general:
        return generalPage(settings);
      case Views.detailVideo:
        return detailVideoPage(settings);
      case Views.fullVideo:
        return fullVideoPage(settings);
    }
  }
}
