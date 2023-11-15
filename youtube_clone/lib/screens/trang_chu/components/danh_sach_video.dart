import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/screens/home/controller/home_controller.dart';
import 'package:youtube_clone/screens/trang_chu/components/video/video.dart';
import 'package:youtube_clone/common_components/base_widget/base_widget.dart';
import 'package:youtube_clone/screens/trang_chu/controllers/danh_sach_video_controller.dart';

class DanhSachVideo extends BaseWidget<DanhSachVideoController> {
  DanhSachVideo({super.key}) : super(DanhSachVideoController());

  @override
  void onReady(
    BuildContext context,
    DanhSachVideoController baseController,
  ) {
    super.onReady(context, baseController);
    HomeController homeController = context.read<HomeController>();
    homeController.onTapTrangChuVideo(ontap: baseController.ontapVideo);
    homeController.disposeTrangChuVideo(dispose: baseController.disposeVideo);
  }

  @override
  Widget getMainView(
    BuildContext context,
    DanhSachVideoController baseController,
  ) {
    return ListView.separated(
      controller: baseController.controller,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: baseController.videos.length,
      itemBuilder: (_, index) => Video(baseController.videos[index]),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
