import 'package:cus_form/bloc/form_controller_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef OnSave = Function(
  BuildContext context,
  bool canSave,
);

class CusFormSave<T extends FormControllerBloc> extends StatelessWidget {
  const CusFormSave({
    super.key,
    required this.builder,
  });

  final OnSave builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, FormUpdate>(builder: (context, state) {
      return builder(
        context,
        state.fieldDidChange,
      );
    });
  }
}
