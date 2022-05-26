import 'package:message/model/message_model.dart';

import '../resources/constants/constants.dart';
import 'apiconstant.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'chat_controller.dart';

class SocketController {
  static Future conSocket(Future<dynamic> function) async {
    var baseUrl = ApiConstant().baseUrl + ApiConstant().postSocket;
    socket = io.io(
        baseUrl,
        io.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection // optional
            .build());
    // setUpSocket(chatController);
    socket.connect();
    socket.on('connect', (_) {
      function;
    });
  }

  static void setUpSocket(ChatController chatController) {
    socket.on('message-receive', (data) {
      ChatController.chatMess.add(MessageModel.formJson(data));
    });
  }
}
