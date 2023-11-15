import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/my_app/controllers/check_internet_controller/check_internet_controller.dart';
import 'package:youtube_clone/my_app/controllers/sharedpreferences_setting/sharedpreferences_setting.dart';
import 'package:youtube_clone/my_app/controllers/theme_controller/theme_controller.dart';
import 'package:youtube_clone/my_app/routers/routers_screens.dart';
import 'package:youtube_clone/my_app/theme/theme_data.dart';
import 'package:youtube_clone/my_app/utils/my_app_navigator.dart';
import 'package:youtube_clone/screens/home/controller/home_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeController>(create: (_) =>ThemeController()),
        ChangeNotifierProvider<HomeController>(create: (_)=> HomeController()),
      ],
      builder: (_, __) {
        return Consumer<ThemeController>(
          builder: (_, baseController, __) {
            return MaterialApp(
              title: 'YouTube',
              theme: ThemeDataApp.lightTheme,
              darkTheme: ThemeDataApp.dartTheme,
              themeMode: baseController.themeMode,
              debugShowCheckedModeBanner: false,
              initialRoute: routes.routerInitial,
              onGenerateRoute: routes.onGenerateRoute,
            );
          },
        );
      },
    );
  }

  static MyAppRoutes routes = MyAppRoutes.intanse;

  static MyAppNavigator navigator = MyAppNavigator.instance;

  static CheckInternetControler internet = CheckInternetControler.instance;

  static SharedPreferencesSetting setting = SharedPreferencesSetting.instance;

  static Future<T?>? to<T>(
    BuildContext context,
    dynamic view, {
    int? idData,
    Map<String, String>? arguments,
  }) =>
      navigator.to<T>(
        context,
        view,
        idData: idData,
        arguments: arguments,
      );

  static void back<T>(
    BuildContext context, {
    Map<String, String>? result,
  }) =>
      navigator.back<T>(
        context,
        result: result,
      );
}
