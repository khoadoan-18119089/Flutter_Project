import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/common/icon.dart';
import 'package:youtube_clone/screens/home/controller/home_controller.dart';
import 'package:youtube_clone/main.dart';
import 'package:youtube_clone/common_components/custom_appbar.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/common_components/custom_text.dart';
import 'package:youtube_clone/my_app/routers/views.dart';

class YoutubeAppBar extends CustomAppBar {
  const YoutubeAppBar({super.key});

  @override
  bool get hasLeading => false;

  @override
  Widget? get widgetTitle => Row(
        children: [
          CustomIcon.logo(
            IconLogo.iconYoutube,
            size: 32,
          ),
          const SizedBox(width: 4),
          const CustomText('YouTube'),
        ],
      );

  @override
  List<Widget> Function(BuildContext)? get actions => (context) => [
        IconButton(
          icon: CustomIcon(
            IconAppbar.iconStream,
            size: 22,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: CustomIcon(
            IconAppbar.iconNotification,
            size: 22,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: CustomIcon(
            IconAppbar.iconSearch,
            size: 20,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: CircleAvatar(
            backgroundImage: AssetImage(
              IconImage.imageUser,
            ),
          ),
          onPressed: () {
            context.read<HomeController>().userDispose();
            MyApp.to(context, Views.user);
          },
        ),
      ];
}
