import 'package:cus_form/form/form_item.dart/form_item_model.dart';

extension MessegeEXT<T> on FormItem<T> {
  String get invalid => 'Vui lòng nhập thông tin';

  String get customInvalid {
    switch (type) {
      case FormItemType.text:
        return invalid;
      case FormItemType.email:
        return 'Vui lòng nhập email hợp lệ';
      case FormItemType.password:
        return 'Mật khẩu phải có ít nhất 6 ký tự';
      default:
        return '';
    }
  }
}
