import 'package:chat_app/components/gradient_widget.dart';
import 'package:chat_app/components/message_icon.dart';
import 'package:chat_app/screens/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:wow_views/components/wow_text.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key) {
    SplashController.checkInternetConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MessageIcon(
                screen: '$SplashScreen',
              ),
              const Spacer(),
              GradientWidget(
                colors: const [
                  Color(0xFF178bff),
                  Color(0xFF9d37fe),
                  Color(0xFFff616d),
                ],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WowText.listTitle('Form', fontWeight: FontWeight.w600),
                    const SizedBox(height: 8),
                    WowText.listTitle('FACEBOOK', fontWeight: FontWeight.w600),
                    const SizedBox(height: 16),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
