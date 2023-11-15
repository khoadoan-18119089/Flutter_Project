import 'package:flutter/material.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/my_app/routers/views.dart';

class HomeTabItem extends BottomNavigationBarItem {
  HomeTabItem({
    required this.select,
    required this.unSelect,
    required this.title,
    required this.view,
    required this.screen,
    this.ontap,
    this.disposetap,
  }) : super(
          activeIcon: CustomIcon(select),
          icon: CustomIcon(unSelect),
          label: title,
        );
  HomeTabItem.middle({
    required this.select,
    this.ontap,
  })  : unSelect = '',
        title = '',
        view = null,
        screen = null,
        disposetap = null,
        super(
          icon: CustomIcon(
            select,
            size: 45,
          ),
          label: '',
        );

  final String select;

  final String unSelect;

  final String title;

  final Views? view;

  final Widget? screen;

  final void Function()? ontap;

  final void Function()? disposetap;
}
