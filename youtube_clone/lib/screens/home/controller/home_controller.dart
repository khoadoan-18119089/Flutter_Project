import 'package:flutter/material.dart';
import 'package:youtube_clone/my_app/routers/views.dart';
import 'package:youtube_clone/screens/home/components/home_tab_item.dart';

class HomeController extends ChangeNotifier {
  late List<HomeTabItem> _tabs;
  List<HomeTabItem> get tabs => _tabs;

  late List<Widget> _screens;
  List<Widget> get screens => _screens;

  final Widget _empty = const SizedBox.shrink();

  late int _selectIndex = 0;
  int get selectIndex => _selectIndex;

  void changeNavigationTab(int index) {
    _selectIndex = index;
    notifyListeners();
  }

  void changeScreen({required int index}) {
    Widget? screen = _getScreen(index);
    if (screens[index] == _empty && screen != null) {
      screens[index] = screen;
    }
  }

  late Function(int) _animateToPage;

  late Function() _onTapTrangChu = () {};

  late Function() _disposeTrangChu = () {};

  late Function() _ontapShorts = () {};

  late Function() _disposeShorts = () {};

  late Function() _ontapSubscriptions = () {};

  late Function() _disposeSubscriptions = () {};

  void changeTab(int index) {
    Views? oldView = _getView(selectIndex);
    Views? newView = _getView(index);
    if (newView != null &&
        tabs.map((e) => e.view).contains(newView) &&
        newView != oldView) {
      void Function()? disposetap =
          tabs.firstWhere((tab) => tab.view == oldView).disposetap;
      if (disposetap != null) disposetap();
      changeScreen(index: index);
      _animateToPage(index);
      changeNavigationTab(index);
    }
    void Function()? ontap = tabs[index].ontap;
    if (ontap != null) ontap();
  }

  void userDispose() {
    Views? view = _getView(selectIndex);
    if (view != null) {
      void Function()? disposetap =
          tabs.firstWhere((tab) => tab.view == view).disposetap;
      if (disposetap != null) disposetap();
    }
  }
}

extension InitHome on HomeController {
  void initavigationTab({
    required List<HomeTabItem> tabs,
  }) {
    _tabs = tabs;
  }

  void initHomeBody() {
    _screens = tabs.map((e) => _empty).toList();
    changeScreen(index: 0);
  }
}

extension GetInfoTab on HomeController {
  Views? _getView(int index) => tabs[index].view;

  Widget? _getScreen(int index) => tabs[index].screen;
}

extension AnimateToPage on HomeController {
  void animateToPage({
    required Function(int) animateToPage,
  }) {
    _animateToPage = animateToPage;
  }
}

extension TrangChu on HomeController {
  void onTapTrangChuVideo({required Function() ontap}) =>
      _onTapTrangChu = ontap;

  void onTapTrangChu() => _onTapTrangChu();

  void disposeTrangChuVideo({required Function() dispose}) =>
      _disposeTrangChu = dispose;

  void disposeTrangChu() => _disposeTrangChu();
}

extension Shorts on HomeController {
  void onTapShortsVideo({required Function() ontap}) => _ontapShorts = ontap;

  void ontapShorts() => _ontapShorts();

  void disposeShortsVideo({required Function() dispose}) =>
      _disposeShorts = dispose;

  void disposeShorts() => _disposeShorts();
}

extension Subscriptions on HomeController {
  void onTapSubscriptionsVideo({required Function() ontap}) =>
      _ontapSubscriptions = ontap;

  void ontapSubscriptions() => _ontapSubscriptions();

  void disposeSubscriptionsVideo({required Function() dispose}) =>
      _disposeSubscriptions = dispose;

  void disposeSubscriptions() => _disposeSubscriptions();
}
