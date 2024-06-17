import 'package:cus_form/bloc/form_controller_bloc.dart';
import 'package:cus_form/form/cus_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

class CusForm<T extends FormControllerBloc> extends Form {
  const CusForm({super.key, this.controller, required super.child});

  final T? controller;
  @override
  CusFormState createState() => CusFormState();
}

class CusFormState<T extends FormControllerBloc> extends FormState {
  @override
  CusForm get widget => super.widget as CusForm;

  final Set<CusFormFieldState> _fields = <CusFormFieldState>{};

  late FormControllerBloc _controller;
  FormControllerBloc get controller => _controller;

  @override
  void initState() {
    _controller = widget.controller ?? FormControllerBloc();
    super.initState();
  }

  @override
  void save() {
    FocusScope.of(context).unfocus();
    super.save();
  }

  void register(CusFormFieldState field) {
    _fields.add(field);
  }

  void unRegister(CusFormFieldState field) {
    _fields.remove(field);
  }

  bool fieldDidChange() {
    return _fields.any(
      (CusFormFieldState field) => field.didChangeValue,
    );
  }

  V? getValue<V>(String fieldName) {
    CusFormFieldState? field = _fields.firstWhereOrNull(
      (CusFormFieldState field) => field.item.fieldName == fieldName,
    );
    var value = field?.value;
    if (value is! V) return null;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => controller
        ..init(
          fieldDidChange: fieldDidChange,
          reset: reset,
          getValue: getValue,
          validate: validate,
        ),
      child: super.build(context),
    );
  }
}
