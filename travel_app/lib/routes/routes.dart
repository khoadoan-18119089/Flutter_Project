import 'package:flutter/material.dart';

import '../views/HomePage/homepage.dart';
import '../views/SplashScreen/splashscreen.dart';
import '../views/ViewDetails/viewDetails.dart';

class AppRoutes {
  static const String ROUTE_Initial = ROUTE_Splashscreen;

  static const String ROUTE_Home = "/home";
  static const String ROUTE_Splashscreen = "/splash";
  static const String ROUTE_ViewDetails = "/view";
  static const String ROUTE_Login = "/login";

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_Home:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomePage());
      case ROUTE_Splashscreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => SplashScreen());
      case ROUTE_ViewDetails:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ViewDetails());
      case ROUTE_Login:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomePage());
    }
    return MaterialPageRoute(
        settings: settings, builder: (_) => const HomePage());
  }
}
