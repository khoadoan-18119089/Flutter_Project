import 'package:chat_app/controllers/messager_controller.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/model/image_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetailChatController extends GetxController {
  var message = '';
  var emailNhan = '';
  var listMessLenght = 0;
  var filename = '';
  var fieldpath = '';

  sendMess() async {
    await MyApp.sendMess(message,
        emailNhan: emailNhan, listMessLenght: listMessLenght, type: 'text');
  }

  sendHinhAnh() async {
    var controller = Get.put(MessagerIconController());
    await MyApp.imagePicker(ImageSource.gallery);
    filename = ImageModel(controller.data!).fileName;
    await MyApp.upImage(controller.data!);
    await MyApp.baseurl(filename);
    await MyApp.sendMess(MyApp.url,
        emailNhan: emailNhan, listMessLenght: listMessLenght, type: 'image');
  }

  sendCamera() async {
    var controller = Get.put(MessagerIconController());
    await MyApp.imagePicker(ImageSource.camera);
    filename = ImageModel(controller.data!).fileName;
    await MyApp.upImage(controller.data!);
    await MyApp.baseurl(filename);
    await MyApp.sendMess(MyApp.url,
        emailNhan: emailNhan, listMessLenght: listMessLenght, type: 'image');
  }

  sendCall() async {
    await MyApp.sendMess(message,
        emailNhan: emailNhan,
        listMessLenght: listMessLenght,
        type: 'call',
        trangThaiCall: 'goi');
  }
}
