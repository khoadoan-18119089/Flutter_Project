import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/screens/home/controller/home_controller.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (_,baseController,__) {
        return BottomNavigationBar(
          currentIndex: baseController.selectIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: baseController.tabs,
          onTap: baseController.changeTab,
        );
      }
    );
  }
}
