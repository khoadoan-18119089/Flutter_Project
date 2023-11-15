import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  void getCurrenUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    final auth = FirebaseAuth.instance;
    await auth.signOut();
  }

  @override
  void onInit() {
    getCurrenUser();
    super.onInit();
  }
}
