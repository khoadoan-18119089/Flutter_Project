import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:message/screen/log_in/login_screen.dart';
import 'package:message/screen/main/chat_detail_screen.dart';
import 'package:message/screen/main/chat_screen.dart';
import 'package:message/screen/register/register_screen.dart';
import 'package:message/screen/splash/splash_screen.dart';
import 'package:message/screen/wellcome/wellcome_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Message());
}

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: Colors.white,
            ),
          ),
          initialRoute: SplashScreen.id,
          routes: {
            SplashScreen.id: (context) => const SplashScreen(),
            WellcomeScreen.id: (context) => const WellcomeScreen(),
            LoginScreen.id: (context) => const LoginScreen(),
            RegisterScreen.id: (context) => const RegisterScreen(),
            ChatScreen.id: (context) => const ChatScreen(),
            ChatDetailScreen.id: (context) => const ChatDetailScreen(),
          },
        );
      },
    );
  }
}
