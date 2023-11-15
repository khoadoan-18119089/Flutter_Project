import 'package:chat_app/main.dart';
import 'package:chat_app/screens/chat_screen/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  var showPass = true;
  var email = '';
  var pass = '';

  onClickShowPass() {
    showPass = !showPass;
    update();
  }

  logIn() async {
    FocusScope.of(Get.context!).unfocus();
    MyApp.showWaiting();
    try {
      await auth.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      MyApp.dangPhatTrien('Đăng nhập thành công!');

      MyApp.hideWaiting();
      MyApp.to(() => ChatScreen());
    } catch (_) {
      MyApp.dangPhatTrien(
          'Email sai hoặc PassWord sai có thể tài khoản chưa được tạo!');
      MyApp.hideWaiting();
    }
  }
}
