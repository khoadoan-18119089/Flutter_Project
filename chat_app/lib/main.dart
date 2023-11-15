import 'package:chat_app/common/theme/text_theme.dart';
import 'package:chat_app/common/theme/theme_data.dart';
import 'package:chat_app/controllers/date_time_controller.dart';
import 'package:chat_app/controllers/image_picker_controller.dart';
import 'package:chat_app/controllers/up_down_Image_controller.dart';
import 'package:chat_app/controllers/up_down_mess_controlller.dart';
import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/my_app/utils/my_app_loader.dart';
import 'package:chat_app/my_app/utils/my_app_notification.dart';
import 'package:chat_app/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wow_views/common/text_style.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: internThemeData,
      onInit: () {
        WowTextStyle.initTextTheme(internTextTheme);
      },
      home: SplashScreen(),
    );
  }

  ///
  ///
  static String url = '';
  static Future waitting({required Future Function() future}) =>
      MyAppLoader.waitting(future: future);

  static void showWaiting() => MyAppLoader.showWaiting();
  static void hideWaiting() => MyAppLoader.hideWaiting();

  /// Nếu thay đổi nội dung dùng [text]
  static void dangPhatTrien([String? message]) =>
      MyAppNotification.dangPhatTrien(message);

  static void to(T, {Map<String, Object?>? arguments}) =>
      Get.to(T, arguments: arguments);

  static Future<void> imagePicker(ImageSource source,
          {bool isMultiImage = false}) =>
      ImagePickerController.onImageButtonPressed(source,
          isMultiImage: isMultiImage);

  static Future<void> upImage(Map<String, Object?> data) =>
      UpDownImageController.uploadFile(data: data);

  static Future<void> downImage(String name) =>
      UpDownImageController.downLoadUrl(name: name);
  static Future<void> logOut() => UserController().signOut();

  static String now() => DateTimeController.nowDateTime();
  static String fortmat(int n) => DateTimeController.formatTime(n);

  static Future<void> sendMess(String mess,
          {required String emailNhan,
          required int listMessLenght,
          required String type,
          String? trangThaiCall}) =>
      UpDownMessController.upMess(mess,
          emailNhan: emailNhan,
          listMessLenght: listMessLenght,
          type: type,
          trangThaiCall: trangThaiCall);
  static void readMess({required String emailNhan}) =>
      UpDownMessController.downMess(emailNhan: emailNhan);
  static Future<void> baseurl(String name) async {
    url = await UpDownImageController.downLoadUrl(name: name);
  }

  static Future<void> updateCall(
          {required String emailNhan, required String iD}) =>
      UpDownMessController.updateCall(emailNhan: emailNhan, iD: iD);
  static Future<void> back2() async {
    Get.back();
    Get.back();
  }
}
