import 'package:cus_form/form/form_item.dart/form_item_model.dart';

extension FormatEXT<T> on FormItem<T> {
  T? tryCast(String? value) {
    if (value == null) return null;
    if (T == String ||
        FormItemType.values
            .where((item) => item.type == String)
            .contains(type)) {
      if (value.isEmpty) {
        return null;
      }
      return value as T;
    }
    return null;
  }
}
