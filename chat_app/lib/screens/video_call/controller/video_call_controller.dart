import 'package:chat_app/main.dart';

class VideoCallController {
  var message = '';
  var emailNhan = '';
  sendCall(String id) async {
    await MyApp.updateCall(emailNhan: emailNhan, iD: id);
  }
}
