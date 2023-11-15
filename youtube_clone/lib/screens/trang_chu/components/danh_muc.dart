import 'package:flutter/material.dart';
import 'package:youtube_clone/common/icon.dart';
import 'package:youtube_clone/common_components/base_widget/base_widget.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/common_components/tab_bar_custom/tab_bar_custom.dart';
import 'package:youtube_clone/common_components/tab_bar_custom/tabbar_skeleton.dart';
import 'package:youtube_clone/screens/trang_chu/controllers/danh_muc_controller.dart';

class DanhMuc extends BaseWidget<DanhMucController> {
  DanhMuc({super.key}): super(DanhMucController());

  @override
  Widget getMainView(BuildContext context, DanhMucController baseController) {
    return TabBarCusTom(
      theFirst: theFirst(context),
      list: baseController.dsMuc,
    );
  }

  Widget theFirst(BuildContext context) {
    return GestureDetector(
      child: CustomIcon(IconAppbar.iconCompass),
      onTap: () => Scaffold.of(context).openDrawer(),
    );
  }

  @override
  Widget getSkeletonView(BuildContext context) {
    return const TabbarSkeleton();
  }
}
