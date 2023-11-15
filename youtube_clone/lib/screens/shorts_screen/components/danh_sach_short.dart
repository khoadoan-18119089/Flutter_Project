import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/screens/home/controller/home_controller.dart';
import 'package:youtube_clone/screens/shorts_screen/components/short/short.dart';
import 'package:youtube_clone/common_components/base_widget/base_widget.dart';
import 'package:youtube_clone/screens/shorts_screen/controller/danh_sach_short_controller.dart';

class DanhSachShort extends BaseWidget<DanhSachShortController> {
  DanhSachShort({super.key}) : super(DanhSachShortController());

  @override
  void onReady(
    BuildContext context,
    DanhSachShortController baseController,
  ) {
    super.onReady(context, baseController);
    HomeController homeController = context.read<HomeController>();
    homeController.onTapShortsVideo(ontap: baseController.ontapShort);
    homeController.disposeShortsVideo(dispose: baseController.disposeShort);
  }

  @override
  Widget getMainView(
    BuildContext context,
    DanhSachShortController baseController,
  ) {
    return PageView.builder(
      controller: baseController.pageController,
      scrollDirection: Axis.vertical,
      itemCount: baseController.shorts.length,
      itemBuilder: (_, index) {
        return Short(baseController.shorts[index]);
      },
    );
  }
}
