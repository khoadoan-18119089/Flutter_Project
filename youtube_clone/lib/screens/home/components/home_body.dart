import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/screens/home/controller/home_controller.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _animateToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final baseController = context.read<HomeController>();
    baseController.initHomeBody();
    baseController.animateToPage(animateToPage: _animateToPage);
    List<Widget> screens = baseController.screens;
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: screens.length,
      itemBuilder: (_, index) => _ScreenTab(child: screens[index]),
    );
  }
}

class _ScreenTab extends StatefulWidget {
  const _ScreenTab({required this.child});

  final Widget child;

  @override
  State<_ScreenTab> createState() => __ScreenTabState();
}

class __ScreenTabState extends State<_ScreenTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
