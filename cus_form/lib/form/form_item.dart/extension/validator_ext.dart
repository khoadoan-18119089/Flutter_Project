import 'package:cus_form/form/form_item.dart/extension/messege_ext.dart';
import 'package:cus_form/form/form_item.dart/form_item_model.dart';

extension ValidatorEXT<T> on FormItem<T> {
  String? defaultValidator(T? value) {
    switch (type) {
      case FormItemType.none:
        return null;
      case FormItemType.text:
        return _text(value);
      case FormItemType.email:
        return _email(value);
      case FormItemType.password:
        return _password(value);
    }
  }

  String? _text(T? value) {
    String? text;
    if (value is String) text = value;
    if (text == null || text.isEmpty) {
      return isRequired ? invalid : null;
    }
    return null;
  }

  String? _email(T? value) {
    String? email;
    if (value is String) email = value;
    if (email == null || email.isEmpty) {
      return isRequired ? invalid : null;
    }
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email)) {
      return customInvalid;
    }
    return null;
  }

  String? _password(T? value) {
    String? password;
    if (value is String) password = value;
    if (password == null || password.isEmpty) {
      return isRequired ? invalid : null;
    }
    if (password.length < 6) {
      return customInvalid;
    }
    return null;
  }
}
