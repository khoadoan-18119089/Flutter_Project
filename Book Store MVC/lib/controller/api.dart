import 'dart:io' show Platform;

class ApiConstant {
  String api = 'api.php?';
  String slider = 'slider';
  String latest = 'latest';
  String category = 'category';
  String coming = 'coming';
  String register = 'utils/register.php';
  String login = 'utils/login.php';
  String viewPhoto = 'utils/viewphoto.php';

  String baseUrl() {
    String baseUrlWeb = 'http://127.0.0.1/ebookapp/';
    String baseUrlMobile = 'http://192.168.2.65/ebookapp/';
    bool kisweb = false;
    try {
      if (Platform.isAndroid) {
        return baseUrlMobile;
      } else if (Platform.isIOS) {
        return baseUrlMobile;
      }
    } catch (e) {
      kisweb = true;
      if (kisweb) {
        //* Runing on platform web
        return baseUrlWeb;
      }
    }
    return baseUrlWeb;
  }
}
