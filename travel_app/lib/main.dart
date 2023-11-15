import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/routes/routes.dart';
import './constants/constants.dart';
import './theme.dart';
import 'views/HomePage/state/homepageStateProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageStateProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kHomePageTitle,
        theme: kAppTheme,
        initialRoute: AppRoutes.ROUTE_Initial,
        onGenerateRoute: AppRoutes.generateRoutes,
      ),
    );
  }
}
