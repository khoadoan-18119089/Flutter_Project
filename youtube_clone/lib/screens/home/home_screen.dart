import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/common/icon.dart';
import 'package:youtube_clone/screens/home/controller/home_controller.dart';
import 'package:youtube_clone/my_app/routers/views.dart';
import 'package:youtube_clone/screens/home/components/home_body.dart';
import 'package:youtube_clone/screens/home/components/home_bottom__navigation_bar.dart';
import 'package:youtube_clone/screens/home/components/home_tab_item.dart';
import 'package:youtube_clone/screens/library_screen/library_screen.dart';
import 'package:youtube_clone/screens/shorts_screen/shorts_screen.dart';
import 'package:youtube_clone/screens/subscriptions_screen/subsriptions_screen.dart';
import 'package:youtube_clone/screens/trang_chu/components/menu_trang_chu.dart';
import 'package:youtube_clone/screens/trang_chu/trang_chu_screen.dart';
import 'package:youtube_clone/common_components/suport_bottomsheet.dart';
import 'package:youtube_clone/screens/home/components/youtube_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animation;

  List<HomeTabItem> get _tabs {
    HomeController homeController = context.read<HomeController>();
    return [
      HomeTabItem(
        select: IconNavigationBar.iconHomeBold,
        unSelect: IconNavigationBar.iconHome,
        title: 'Trang chủ',
        view: Views.trangChu,
        screen: const TrangChuScreen(),
        ontap: homeController.onTapTrangChu,
        disposetap: homeController.disposeTrangChu,
      ),
      HomeTabItem(
        select: IconNavigationBar.iconShortBold,
        unSelect: IconNavigationBar.iconShort,
        title: 'Shorts',
        view: Views.short,
        screen: const ShortsScreen(),
        ontap: homeController.ontapShorts,
        disposetap: homeController.disposeShorts,
      ),
      HomeTabItem.middle(
        select: IconNavigationBar.iconAdd,
        ontap: _changeCenterTab,
      ),
      HomeTabItem(
          select: IconNavigationBar.iconSubcriptionBold,
          unSelect: IconNavigationBar.iconSubcription,
          title: 'Kênh đăng ký',
          view: Views.subscriptions,
          screen: const SubcriptionsScreen(),
          ontap: homeController.ontapSubscriptions,
          disposetap: homeController.disposeSubscriptions),
      HomeTabItem(
        select: IconNavigationBar.iconLibraryBold,
        unSelect: IconNavigationBar.iconLibrary,
        title: 'Thư viện',
        view: Views.library,
        screen: const LibraryScreen(),
      ),
    ];
  }

  @override
  void initState() {
    initAnimationBottomsheet();
    super.initState();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  void initAnimationBottomsheet() {
    _animation = BottomSheet.createAnimationController(this);
    _animation.drive(CurveTween(curve: Curves.easeIn));
  }

  void _changeCenterTab() {
    showModalBottomSheet(
      context: context,
      transitionAnimationController: _animation,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 32,
      ),
      builder: (_) => const SuportBottomsheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, baseController, _) {
        baseController.initavigationTab(tabs: _tabs);
        return Scaffold(
          appBar:
              baseController.selectIndex == 1 ? null : const YoutubeAppBar(),
          drawer: const MenuTrangChu(),
          body: const HomeBody(),
          bottomNavigationBar: const HomeBottomNavigationBar(),
        );
      },
    );
  }
}
