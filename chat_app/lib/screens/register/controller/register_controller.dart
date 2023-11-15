import 'package:chat_app/controllers/messager_controller.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/screens/log_in/log_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as store;
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final controller = Get.put(MessagerIconController());
  var showPass = true;

  String? email;
  var name = '';
  var pass = '';
  var birth = '';

  onClickShowPass() {
    showPass = !showPass;
    update();
  }

  register() async {
    final controller = Get.put(MessagerIconController());
    FocusScope.of(Get.context!).unfocus();
    MyApp.showWaiting();
    try {
      await auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: pass);
      await MyApp.upImage(controller.data!);
      var user = store.FirebaseFirestore.instance.collection('user').doc(email);
      await user.set({
        'email': email,
        'name': name,
        'birth': birth,
        'avatar': controller.fileName,
      });
      controller.fileName = '';
      controller.filePath = '';
      MyApp.hideWaiting();
      MyApp.dangPhatTrien('Đăng ký thành công!');
      MyApp.to(()=>LogInSccreen());
    } catch (_) {
      MyApp.hideWaiting();
      MyApp.dangPhatTrien('Tài khoản đã được tạo!');
    }
  }
}
