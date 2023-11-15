import 'dart:io';

class CheckInternetControler {
  CheckInternetControler._();
  factory CheckInternetControler() => instance;
  static final CheckInternetControler instance = CheckInternetControler._();

  Future<bool> checkConnection() async {
    bool isConnect = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnect = true;
      }
    } on SocketException catch (_) {
      isConnect = false;
    }
    return isConnect;
  }
}
