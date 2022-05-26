import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:message/controller/check_internet_controller.dart';
import 'package:message/widget/gradient_widget.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    CheckInternetController().checkInternetConnection(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
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
                size: 75.w,
              ),
            ),),
          ),
          SizedBox(height: 35.h,),
          GradientWidget(
              colors: const [
                Color(0xFF178bff),
                Color(0xFF9d37fe),
                Color(0xFFff616d),
              ],
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Form',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFFc3c3c3),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'FACEBOOK',
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
