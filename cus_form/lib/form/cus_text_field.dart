import 'package:flutter/material.dart';

class CusTextField extends TextField {
  CusTextField({
    super.key,
    super.controller,
    Widget? lable,
    String? lableText,
    Widget? prefixIcon,
    Color? prefixIconColor,
    String? hintText,
    TextStyle? hintStyle,
    Widget? suffixIcon,
    Color? suffixIconColor,
    InputDecoration? decoration,
    super.onChanged,
    String? errorText,
    super.enabled = true,
  }) : super(
          decoration: decoration ??
              InputDecoration(
                label: lable,
                labelText: lable != null ? null : lableText,
                prefixIcon: prefixIcon,
                prefixIconColor: prefixIconColor ?? const Color(0XFF328eae),
                suffixIcon: suffixIcon,
                suffixIconColor: suffixIconColor ?? const Color(0XFF328eae),
                hintText: hintText,
                hintStyle:
                    hintStyle ?? const TextStyle(color: Color(0XFF328eae)),
                errorText: errorText,
                filled: true,
                fillColor: const Color(0XFFfdf7e2),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide(
                    color: Color(0XFF1e5568),
                    width: 2,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide(
                    color: Color(0XFF1e5568),
                    width: 2,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide(
                    color: Color(0XFF1e5568),
                    width: 2,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
              ),
        );
}
