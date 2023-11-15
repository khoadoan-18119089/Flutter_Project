import 'package:flutter/material.dart';
import 'package:youtube_clone/common/field_name.dart';
import 'package:youtube_clone/my_app/routers/views.dart';

class MyAppNavigator {
  MyAppNavigator._();
  factory MyAppNavigator() => instance;
  static final MyAppNavigator instance = MyAppNavigator._();

  Future<T?>? to<T>(
    BuildContext context,
    dynamic view, {
    int? idData,
    Map<String, String>? arguments,
  }) {
    Views? route;
    if (view is String) {
      route = Views.fromPath(view);
    } else if (view is int) {
      route = Views.fromId(view);
    } else if (view is Views) {
      route = view;
    } else {
      return null;
    }
    if (idData != null && idData > 0) {
      if (arguments != null) {
        arguments.addAll({fieldId: idData.toString()});
      } else {
        arguments = {fieldId: idData.toString()};
      }
    }
    return Navigator.pushNamed(
      context,
      route.path,
      arguments: arguments,
    );
  }

  void back<T extends Object?>(
    BuildContext context, {
    Map<String, String>? result,
  }) {
    return Navigator.pop(
      context,
      result,
    );
  }
}
