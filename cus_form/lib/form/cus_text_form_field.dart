import 'package:cus_form/form/cus_form_field.dart';
import 'package:cus_form/form/cus_text_field.dart';
import 'package:cus_form/form/form_item.dart/extension/format_ext.dart';
import 'package:cus_form/form/form_item.dart/form_item_model.dart';

class CusTextFormField<T> extends CusFormField<T> {
  CusTextFormField({
    super.key,
    required super.formItem,
  }) : super(
          builder: (field) {
            return CusTextField(
              controller: field.textController,
              lable: formItem.lable,
              lableText: formItem.lableText,
              hintText: formItem.hintText,
              errorText: field.errorText,
              onChanged: (value) {
                field.didChange(formItem.tryCast(value));
              },
            );
          },
        );

  @override
  CusFormFieldState<T> createState() => _CusTextFormFieldState<T>();
}

class _CusTextFormFieldState<T> extends CusFormFieldState<T> {
  @override
  CusTextFormField<T> get widget => super.widget as CusTextFormField<T>;

  @override
  void initState() {
    widget.formItem.updateType(FormItemType.text);
    super.initState();
  }

  @override
  void updateTextController() {
    return;
  }
}
