import 'package:chat_app/model/image_model.dart';
import 'package:get/get.dart';

class MessagerIconController extends GetxController {
  var fileName = '';
  var filePath = '';
  Map<String, Object?>? data;
  var baseURL = '';

  pickImage(Map<String, Object?>? data, {required String screen}) {
    var model = ImageModel(data!);
    fileName = model.fileName;
    filePath = model.filePath;
    update(['MesagerIcon-$screen']);
  }
}