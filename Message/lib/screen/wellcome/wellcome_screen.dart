import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../widget/rounded_button.dart';
import '../../widget/gradient_widget.dart';
import '../log_in/login_screen.dart';
import '../register/register_screen.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({Key? key}) : super(key: key);
  static const String id = 'wellcome_screen';

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          right: 24,
          left: 24,
          top: 10.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'messageLogo',
              child: SizedBox(
                child: GradientWidget(
                  colors: const [
                    Color(0xFF178bff),
                    Color(0xFF9d37fe),
                    Color(0xFFff616d),
                  ],
                  child: Icon(
                    FontAwesomeIcons.facebookMessenger,
                    size: 40.w,
                  ),
                ),
              ),
            ),
            Center(
                // ignore: deprecated_member_use
                child: GradientWidget(
              colors: const [
                Color(0xFF178bff),
                Color(0xFF9d37fe),
                Color(0xFFff616d),
              ],
              // ignore: deprecated_member_use
              child: TypewriterAnimatedTextKit(
                text: const ['Message App'],
                textStyle: TextStyle(
                  // ignore: deprecated_member_use
                  fontSize: 45.sp,
                  fontWeight: FontWeight.w900,
                ),
                speed: const Duration(milliseconds: 200),
              ),
            )),
            SizedBox(
              height: 20.h,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            SizedBox(
              height: 1.h,
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
