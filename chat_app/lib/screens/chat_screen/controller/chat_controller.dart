import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final controller = Get.put(UserController());

  Future<List<Map<String, Object?>>> loaduser() async {
    List<Map<String, Object?>> listuser = [];
    final users = await FirebaseFirestore.instance.collection('user').get();
    listuser.clear();
    for (var data in users.docs) {
      listuser.add({
        'name': data.data()['name'],
        'avatar': data.data()['avatar'],
        'email': data.data()['email'],
      });
    }
    return listuser;
  }

  Future<Map<String, Object?>> dataUser(
      {required String email,
      required List<Map<String, Object?>> listUser}) async {
    Map<String, Object?> data = {};
    data.clear();
    for (var datal in listUser) {
      if (UserModer(datal).email == email) {
        data = datal;
      }
    }
    return data;
  }

  var titleTab = 0;
  onClickTab(int index) {
    titleTab = index;
    update(['body']);
  }
}
