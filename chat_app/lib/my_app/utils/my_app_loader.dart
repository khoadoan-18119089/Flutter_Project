import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wow_views/common/color.dart';
import 'package:wowit/interfaces/interfaces.dart';

class MyAppLoader {
  MyAppLoader._();

  static bool _layerWatting = false;

  static final _overlayEntryOpacity = OverlayEntry(
    builder: (context) {
      return Opacity(
        opacity: 0.5,
        child: Container(
          color: TBTColor.black1F2A,
        ),
      );
    },
  );

  static final _overlayEntryLoader = OverlayEntry(
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  static void hideWaiting() {
    if (_layerWatting) {
      _layerWatting = false;
      _overlayEntryLoader.remove();
      _overlayEntryOpacity.remove();
    }
  }

  static void showWaiting() {
    if (_layerWatting) return;
    _layerWatting = true;
    final navigatorState =
        Navigator.of(Get.overlayContext!, rootNavigator: false);
    final overlayState = navigatorState.overlay!;
    overlayState.insert(_overlayEntryOpacity);
    overlayState.insert(_overlayEntryLoader);
  }

  static Future waitting({
    required Future Function() future,
  }) async {
    showWaiting();
    try {
      await future();
      hideWaiting();
    } catch (e) {
      HandleException.log(e);
    } finally {
      hideWaiting();
    }
  }
}
