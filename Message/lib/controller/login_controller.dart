import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:message/resources/constants/constants.dart';
import 'package:message/screen/main/chat_screen.dart';
import '../model/infor_user_model.dart';

class LoginController {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;
  Future<void> signIn(
    String email,
    String password,
    bool showSpinner,
    BuildContext context,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final DocumentReference document = _store.collection('user').doc(email);

      await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
        dynamic data = snapshot.data();
        ChatScreen.imageUser = data['image'];
        ChatScreen.emailUser = email;
        ChatScreen.fullNameUser = data['fullName'];
      });

      await _store.collection('user').doc(email).update(
        {
          'status': status.online.toString(),
        },
      );
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushNamed(context, ChatScreen.id);
      });
      showSpinner = !showSpinner;
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> createUser(
    String name,
    String email,
    String password,
    String brith,
    String baseUrl,
    bool showSpinner,
    BuildContext context,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _store.collection('user').doc(email).set(InformationUserModel(
              fullName: name,
              email: email,
              birth: brith,
              status: status.online.toString(),
              story: story.no.toString(),
              image: baseUrl)
          .toJson());
      ChatScreen.emailUser = email;
      ChatScreen.imageUser = baseUrl;
      ChatScreen.fullNameUser = name;
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushNamed(context, ChatScreen.id);
      });
      showSpinner = !showSpinner;
      // ignore: empty_catches
    } catch (e) {}
  }
}
