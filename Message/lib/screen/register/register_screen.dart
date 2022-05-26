import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:message/controller/firebase_controller.dart';
import 'package:message/resources/constants/constants.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../../../widget/rounded_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../controller/login_controller.dart';
import '../../widget/gradient_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String id = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showSpinner = false;
  bool _showPassword = true;
  late String email;
  late String name;
  late String brith;
  late String password;
  late String fileName;
  late String filePath;
  bool chosseImage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.only(
            right: 24,
            left: 24,
            top: 5.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Hero(
                  tag: 'messageLogo',
                  child: Container(
                    width: 70.w,
                    height: 70.w,
                    decoration: chosseImage
                        ? BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: FileImage(File(filePath)),
                              fit: BoxFit.cover,
                            ))
                        : null,
                    child: GestureDetector(
                      onTap: () async {
                        XFile? images = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (images == null) {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No File Seclected'),
                            ),
                          );
                        } else {
                          setState(() {});
                          chosseImage = true;
                        }
                        filePath = images!.path;
                        fileName = images.name;
                      },
                      child: chosseImage
                          ? null
                          : GradientWidget(
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
                  height: 5.h,
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
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: kTextFieldDecoraTion.copyWith(
                    hintText: 'Enter your name',
                    icon: const Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    brith = value;
                  },
                  decoration: kTextFieldDecoraTion.copyWith(
                    hintText: 'When is your birthday?',
                    icon: const Icon(Icons.calendar_month),
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
                title: 'Register',
                colour: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {});
                  if (password.length == 6) {
                    showSpinner = !showSpinner;
                    StorageController.uploadFile(fileName, filePath);
                    Future.delayed(const Duration(seconds: 4), (() {
                      StorageController.downLoadUrl(fileName);
                      Future.delayed(const Duration(seconds: 2), (() {
                        LoginController().createUser(
                          name,
                          email,
                          password,
                          brith,
                          baseUrl,
                          showSpinner,
                          context,
                        );
                      }));
                    }));
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
