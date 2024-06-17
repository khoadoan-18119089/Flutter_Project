part of 'form_controller_bloc.dart';

@immutable
sealed class FormControllerState {
  final bool fieldDidChange;

  const FormControllerState({this.fieldDidChange = false});

  FormControllerState update({bool fieldDidChange = false});
}

final class FormUpdate extends FormControllerState {
  const FormUpdate({super.fieldDidChange});

  @override
  FormUpdate update({bool fieldDidChange = false}) {
    return FormUpdate(fieldDidChange: fieldDidChange);
  }
}
