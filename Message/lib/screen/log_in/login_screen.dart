import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:message/controller/login_controller.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../../../resources/constants/constants.dart';
import '../../../widget/rounded_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../widget/gradient_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'log_in_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  bool _showPassword = true;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.only(right: 24,left: 24, top: 5.h,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: SizedBox(
                  child: Hero(
                    tag: 'messageLogo',
                    child: GestureDetector(
                      onTap: () {},
                      child: GradientWidget(
                        colors: const [
                          Color(0xFF178bff),
                          Color(0xFF9d37fe),
                          Color(0xFFff616d),
                        ],
                        child: const FittedBox(
                          child: Icon(
                            FontAwesomeIcons.facebookMessenger,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 20.h,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoraTion.copyWith(
                    hintText: 'Enter your email',
                    icon: const Icon(Icons.email),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: _showPassword,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 6,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoraTion.copyWith(
                    hintText: 'Enter your password.',
                    icon: const Icon(Icons.password),
                    suffixIcon: GestureDetector(
                      child: Icon(_showPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                ),
              ),
              RoundedButton(
                title: 'Log In',
                colour: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {});
                  if (password.length == 6) {
                    showSpinner = !showSpinner;
                    LoginController().signIn(
                      email,
                      password,
                      showSpinner,
                      context,
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
