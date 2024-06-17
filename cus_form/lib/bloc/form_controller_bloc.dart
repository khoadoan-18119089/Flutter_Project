import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;
part 'form_controller_event.dart';
part 'form_controller_state.dart';

class FormControllerBloc extends Bloc<FormControllerEvent, FormUpdate>
    with FormControllerMixin {
  FormControllerBloc() : super(const FormUpdate()) {
    on<SaveEvent>((event, emit) {
      emit(state.update(fieldDidChange: fieldDidChange()));
    });
  }
}

mixin FormControllerMixin on Bloc<FormControllerEvent, FormUpdate> {
  final Map<String, dynamic> _data = {};

  bool Function()? _fieldDidChange;
  bool fieldDidChange() {
    return _fieldDidChange?.call() ?? false;
  }

  void onChanged(BuildContext context) {
    if (state.fieldDidChange != fieldDidChange()) {
      context.read<FormControllerBloc>().add(SaveEvent());
    }
  }

  /// Lỗi nhập liệu có trong form
  String? _errorText;
  set errorText(String? value) {
    if (value == null) return;
    if (_errorText != null) return;
    _errorText = value;
  }

  /// Kiểm tra hợp lệ
  bool Function()? _validate;
  bool validate() {
    _errorText = null;
    return _validate?.call() ?? true;
  }

  void save() {
    if (validate()) {
      try {
        saveTempData();
      } catch (e) {
        dev.log(e.toString(), name: '$this.save');
      }
    }
  }

  void Function()? _reset;
  void reset() {
    errorText = null;
    _reset?.call();
  }

  V? Function<V>(String)? _getValue;
  V? getValue<V>(String fieldName) {
    return _getValue?.call(fieldName);
  }

  void setValue({
    required String fieldName,
    required dynamic value,
  }) {
    _data[fieldName] = value;
  }

  Map<String, dynamic> saveTempData() {
    _data.removeWhere((key,value) => value == null);
    return _data;
  }

  void init({
    bool Function()? fieldDidChange,
    void Function()? reset,
    bool Function()? validate,
    V? Function<V>(String)? getValue,
  }) {
    _fieldDidChange = fieldDidChange;
    _reset = reset;
    _validate = validate;
    _getValue = getValue;
  }
}
