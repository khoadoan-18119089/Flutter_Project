import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TBTTextFormField extends TextFormField {
  TBTTextFormField(
      {Key? key,
      super.onChanged,
      super.validator,
      super.autovalidateMode = AutovalidateMode.onUserInteraction,
      super.readOnly,
      super.maxLength,
      super.obscureText,
      super.controller,
      super.keyboardType,
      String? labelText,
      String? hintText,
      Widget? icon,
      Widget? suffixIcon,
      String? text,
      void Function()? onPresshSuffiIcon,
      EdgeInsetsGeometry? contentPadding,
      Pattern? allow})
      : super(
          key: key,
          initialValue: text,
          decoration: InputDecoration(
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            icon: icon,
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: labelText,
            suffixIcon: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onPresshSuffiIcon,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: suffixIcon,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          inputFormatters:
              allow != null ? [FilteringTextInputFormatter.allow(allow)] : null,
        );
}
