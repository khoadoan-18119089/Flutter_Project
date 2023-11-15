import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/components/gradient_widget.dart';
import 'package:chat_app/components/message_icon.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/screens/log_in/log_in_screen.dart';
import 'package:chat_app/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:wow_views/common/text_style.dart';

import '../../components/tbt_button.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MessageIcon(
              screen: '$WellcomeScreen',
            ),
            const SizedBox(height: 24),
            Center(
              child: GradientWidget(
                colors: const [
                  Color(0xFF178bff),
                  Color(0xFF9d37fe),
                  Color(0xFFff616d),
                ],
                // ignore: deprecated_member_use
                child: TypewriterAnimatedTextKit(
                  text: const ['Message App'],
                  textStyle: WowTextStyle.listTitle
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 30),
                  speed: const Duration(milliseconds: 200),
                ),
              ),
            ),
            const Spacer(),
            button('Log In', onPressed: () => MyApp.to(() => LogInSccreen())),
            const SizedBox(height: 24),
            button('Register',
                onPressed: () => MyApp.to(() => RegisterScreen())),
          ],
        ),
      ),
    );
  }

  Widget button(String title, {required void Function() onPressed}) {
    return Row(
      children: [
        Expanded(
          child: TBTButton.elevated(
            backgroundColor: Colors.lightBlueAccent,
            text: title,
            margin: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(16),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
