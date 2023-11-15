import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as store;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UpDownMessController {
  UpDownMessController._();
  static Future<void> upMess(String mess,
      {required String emailNhan,
      required int listMessLenght,
      String? trangThaiCall,
      required String type}) async {
    final controller = Get.put(UserController());
    try {
      var user = store.FirebaseFirestore.instance
          .collection('messager')
          .doc(controller.loggedInUser.email)
          .collection(emailNhan)
          .doc(MyApp.fortmat(listMessLenght));
      await user.set({
        'ID': MyApp.fortmat(listMessLenght),
        'mess': mess,
        'timer': MyApp.now(),
        'emailNguoiGui': controller.loggedInUser.email,
        'type': type,
        'trangThaiCall': trangThaiCall,
      });
      var khach = store.FirebaseFirestore.instance
          .collection('messager')
          .doc(emailNhan)
          .collection(controller.loggedInUser.email!)
          .doc(MyApp.fortmat(listMessLenght));
      await khach.set({
        'ID': MyApp.fortmat(listMessLenght),
        'mess': mess,
        'timer': MyApp.now(),
        'emailNguoiGui': controller.loggedInUser.email,
        'type': type,
        'trangThaiCall': trangThaiCall,
      });
    } catch (_) {}
  }

  static Future<void> updateCall(
      {required String emailNhan, required String iD}) async {
    final controller = Get.put(UserController());
    try {
      var user = store.FirebaseFirestore.instance
          .collection('messager')
          .doc(controller.loggedInUser.email)
          .collection(emailNhan)
          .doc(iD);
      await user.update({'trangThaiCall': 'ketThuc'});
      var khach = store.FirebaseFirestore.instance
          .collection('messager')
          .doc(emailNhan)
          .collection(controller.loggedInUser.email!)
          .doc(iD);
      await khach.update({'trangThaiCall': 'ketThuc'});
    } catch (_) {}
  }

  static void downMess({required String emailNhan}) async {
    final controller = Get.put(UserController());
    List<Map<String, Object?>> listl = [];
    try {
      listl.clear();
      await for (var list in FirebaseFirestore.instance
          .collection('messager')
          .doc(controller.loggedInUser.email)
          .collection(emailNhan)
          .snapshots()) {
        for (var data in list.docs) {
          var datamess = data.data();
          listl.add({
            'ID': datamess['ID'],
            'mess': datamess['mess'],
            'timer': datamess['timer'],
            'emailNguoiGui': datamess['emailNguoiGui'],
            'type': datamess['type'],
            'trangThaiCall': datamess['trangThaiCall'],
          });
        }
      }
    } catch (_) {}
  }
}
