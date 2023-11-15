import 'package:flutter/material.dart';
import 'package:youtube_clone/common/field_name.dart';
import 'package:youtube_clone/common/methods.dart';
import 'package:youtube_clone/common_components/base_widget/base_controller.dart';
import 'package:youtube_clone/models/short_model.dart';

class DanhSachShortController extends BaseController {
  @override
  Future<Map<String, List<Map<String, Object?>?>?>?> loadData() async {
    Map<String, List<Map<String, Object?>?>?>? data =
        await getDio('https://datayoutube.000webhostapp.com/shorthome');
    return data;
  }

  List<ShortModel> get shorts => _dsShort;

  final List<ShortModel> _dsShort = [];

  late PageController pageController;

  final int initialPage = 0;

  int? _oldIndex;
  int? get oldIndex => _oldIndex;

  @override
  void onReady() {
    _initDataShorts();
    _initPlayShortFirst();
    pageController = PageController(initialPage: initialPage);
    pageController.addListener(scrollChangeShort);
    super.onReady();
  }

  @override
  void dispose() {
    pageController.removeListener(scrollChangeShort);
    pageController.dispose();
    super.dispose();
  }

  void _initDataShorts() {
    List<Map<String, Object?>> list = Methods.getList(getData, tblVideo);
    _dsShort.addAll(list.map((e) => ShortModel(e)));
  }

  void _initPlayShortFirst() => changeShort(0);

  void scrollChangeShort() {
    int currentPage = pageController.page!.floor();
    if (oldIndex != currentPage) {
      changeShort(currentPage);
    }
  }

  void changeShort(int? newIndex) {
    if (oldIndex != newIndex) {
      if (oldIndex != null) _dsShort[oldIndex!].isPlaying = false;
      if (newIndex != null) _dsShort[newIndex].isPlaying = true;
      _oldIndex = newIndex;
    }
  }

  void ontapShort() => scrollChangeShort();

  void disposeShort() => changeShort(null);
}
