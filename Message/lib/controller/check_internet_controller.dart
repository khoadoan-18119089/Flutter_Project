import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:message/controller/socket_controller.dart';

import '../screen/wellcome/wellcome_screen.dart';

class CheckInternetController {
  Future<void> checkInternetConnection(BuildContext context) async {
    try {
      final response = await InternetAddress.lookup('www.kindacode.com');
      if (response.isNotEmpty) {
        // ignore: use_build_context_synchronously
        SocketController.conSocket(next(context));
      }
    } on SocketException catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  Future<dynamic> next(BuildContext context) {
    return Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, WellcomeScreen.id);
    });
  }
}
