import 'dart:io';

import 'package:chat_app/model/image_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;

class UpDownImageController {
  static var baseurl = '';
  UpDownImageController._();
  static Future<void> uploadFile({required Map<String, Object?> data}) async {
    var model = ImageModel(data);
    var fileName = model.fileName;
    var filePath = model.filePath;
    final storageFire = storage.FirebaseStorage.instance;
    File file = File(filePath);
    try {
      await storageFire.ref('image/$fileName').putFile(file);
    } on storage.FirebaseException catch (_) {}
  }

  static Future<String> downLoadUrl({required String name}) async {
    final storageFire = storage.FirebaseStorage.instance;
    UpDownImageController.baseurl =
        await storageFire.ref('image/$name').getDownloadURL();
    return await storageFire.ref('image/$name').getDownloadURL();
  }
}
