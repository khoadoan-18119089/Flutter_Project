import 'dart:io';
import 'package:chat_app/main.dart';
import 'package:chat_app/screens/wellcome/wellcome_screen.dart';

class SplashController {
  SplashController._();

  static Future<void> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await Future.delayed(const Duration(seconds: 2), () {
          MyApp.to(() => const WellcomeScreen());
        });
      }
    } on SocketException catch (_) {
      Future.delayed(const Duration(seconds: 2), () {
        MyApp.dangPhatTrien();
      });
    }
  }
}
