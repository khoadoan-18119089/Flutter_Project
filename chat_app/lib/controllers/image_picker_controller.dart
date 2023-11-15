import 'package:chat_app/common/field_name.dart';
import 'package:chat_app/controllers/messager_controller.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController {
  ImagePickerController._();

  static Future<void> onImageButtonPressed(ImageSource source,
      {bool isMultiImage = false}) async {
    var controller = Get.put(MessagerIconController());
    final XFile? pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      controller.data = {
        fieldImageName: pickedFile.name,
        fieldImagePath: pickedFile.path,
      };
    } else {
      controller.data = {};
    }
  }
}
