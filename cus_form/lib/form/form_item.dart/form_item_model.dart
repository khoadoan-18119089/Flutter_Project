import 'package:cus_form/form/form_item.dart/extension/validator_ext.dart';
import 'package:flutter/material.dart';

enum FormItemType {
  none(null),
  text(String),
  email(String),
  password(int),
  ;

  final Type? type;
  const FormItemType(this.type);
}

typedef _Validator<T> = String? Function(T? value, FormItem<T>);

class FormItem<T> {
  FormItem({
    FormItemType type = FormItemType.none,
    required this.fieldName,
    this.lable,
    this.lableText,
    this.hintText,
    this.initialValue,
    bool canRequestFocus = true,
    bool skipTraversal = false,
  })  : _type = type,
        focusNode = FocusNode(
          canRequestFocus: canRequestFocus,
          skipTraversal: skipTraversal,
        );

  late FormItemType _type;
  FormItemType get type => _type;

  void updateType(FormItemType type) {
    _type = type;
  }

  final String fieldName;

  final Widget? lable;

  final String? lableText;

  final String? hintText;

  final FocusNode focusNode;

  final T? initialValue;

  bool get isRequired => lableText?.endsWith('*') ?? false;

  _Validator<T>? _validator;
  String? validator(T? value) {
    return _validator?.call(value, this) ?? defaultValidator(value);
  }
}
