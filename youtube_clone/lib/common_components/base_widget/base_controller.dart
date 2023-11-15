import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as developer;

abstract class BaseController with ChangeNotifier {
  final Map<String, Object?> params = {};

  final Map<String, List<Map<String, Object?>?>?> _data = {};

  final Map<String, String> messageIdBackUp = {};

  Future<Map<String, List<Map<String, Object?>?>?>?> loadData();

  Map<String, List<Map<String, Object?>?>?> get getData => _data;

  void setData(Map<String, List<Map<String, Object?>?>?> data) {
    _data.clear();
    _data.addAll(data);
  }

  void clearData() {
    params.clear();
    _data.clear();
  }

  Future<Map<String, List<Map<String, Object?>?>?>?> getDio(String path) async {
    try {
      Dio dio = Dio();
      Response<String> response = await dio.get<String>(
        path,
        options: Options(responseType: ResponseType.plain),
        queryParameters: params,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.data ?? '{}');
        Map<String, List<Map<String, Object?>?>?> data =
            responseData.map((key, value) {
          List<Map<String, Object?>?> list = [];
          if (value is List) {
            list.addAll(value.map((e) => e as Map<String, Object?>?));
          } else {
            list.addAll([]);
          }
          return MapEntry(key, list);
        });
        return data;
      }
    } catch (e) {
      developer.log(
        '$e',
        name: 'Provider',
      );
    }
    return null;
  }

  void onInit() {
    developer.log(
      '${toString()} onInit',
      name: 'Provider',
    );
  }

  void onReady() {
    developer.log(
      '${toString()} onReady',
      name: 'Provider',
    );
  }

  @override
  void dispose() {
    developer.log(
      '${toString()} dispose',
      name: 'Provider',
    );
    super.dispose();
  }
}
