import 'package:cus_form/bloc/form_controller_bloc.dart';
import 'package:cus_form/form/cus_form.dart';
import 'package:cus_form/form/form_item.dart/extension/format_ext.dart';
import 'package:cus_form/form/form_item.dart/form_item_model.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class CusFormField<T> extends FormField<T> {
  CusFormField({
    super.key,
    required this.formItem,
    super.enabled = true,
    required Widget Function(CusFormFieldState<T>) builder,
    super.onSaved,
  }) : super(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            initialValue: formItem.initialValue,
            validator: formItem.validator,
            builder: (field) {
              return Focus(
                child: builder.call(field as CusFormFieldState<T>),
                onFocusChange: (isFocus) {
                  String text = isFocus ? 'Đang nhập liệu' : 'Dừng nhập liệu';
                  dev.log(text, name: formItem.fieldName);
                },
              );
            });

  final FormItem<T> formItem;

  @override
  FormFieldState<T> createState() => CusFormFieldState<T>();
}

class CusFormFieldState<T> extends FormFieldState<T> {
  @override
  CusFormField<T> get widget => super.widget as CusFormField<T>;

  TextEditingController textController = TextEditingController();

  FormControllerBloc? _formController;
  FormControllerBloc? get formController => _formController;

  FormItem<T> get item => widget.formItem;

  T? get initialValue => item.initialValue;

  bool get didChangeValue => initialValue != value;

  CusFormState formState(BuildContext context) {
    return Form.of(context) as CusFormState;
  }

  @override
  void initState() {
    setValue(initialValue);
    super.initState();
  }

  @override
  void deactivate() {
    formState(context).unRegister(this);
    super.deactivate();
  }

  void updateTextController() {
    textController.text = (value ?? '').toString();
    textController.selection = TextSelection.collapsed(
      offset: textController.text.length,
    );
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    updateTextController();
    formController?.onChanged(context);
    save();
  }

  @override
  void save() {
    formController?.setValue(
      fieldName: item.fieldName,
      value: item.tryCast(value?.toString()),
    );
  }

  @override
  void reset() {
    super.reset();
    updateTextController();
  }

  @override
  bool validate() {
    formController?.errorText = errorText;
    return super.validate();
  }

  @override
  void setValue(T? value) {
    super.setValue(value);
    updateTextController();
  }

  @override
  Widget build(BuildContext context) {
    formState(context).register(this);
    _formController = (Form.of(context) as CusFormState).controller;
    return super.build(context);
  }
}
