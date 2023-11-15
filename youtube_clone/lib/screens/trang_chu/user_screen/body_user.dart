import 'package:flutter/material.dart';
import 'package:youtube_clone/common/icon.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';
import 'package:youtube_clone/common_components/custom_text.dart';
import 'package:youtube_clone/main.dart';
import 'package:youtube_clone/my_app/routers/views.dart';

class BodyUser extends StatelessWidget {
  BodyUser({super.key});

  final List<Map<String, String>> account = [
    {
      'icon': IconSetting.iconChanel,
      'title': 'Kênh của bạn',
    },
    {
      'icon': IconSetting.iconAnonymous,
      'title': 'Bật Chế độ ẩn danh',
    },
    {
      'icon': IconSetting.iconAddUser,
      'title': 'Thêm tài khoản',
    },
  ];

  final List<Map<String, String>> utilities = [
    {
      'icon': IconSetting.iconYoutubePremium,
      'title': 'Mua YouTube Premium',
    },
    {
      'icon': IconSetting.iconCoin,
      'title': 'Giao dịch mua và gói thành viên',
    },
    {
      'icon': IconSetting.iconTime,
      'title': 'Thời lượng đã xem',
    },
    {
      'icon': IconSetting.iconSecurity,
      'title': 'Dữ liệu của bạn trong YouTube',
    },
  ];

  final List<Map<String, String>> settings = [
    {
      'icon': IconSetting.iconSettings,
      'title': 'Cài đặt',
      'route': Views.setting.path,
    },
    {
      'icon': IconSetting.iconHelp,
      'title': 'Trợ giúp và phản hồi',
    },
  ];

  final List<Map<String, String>> youtube = [
    {
      'icon': IconLogo.iconStudio,
      'title': 'YouTube Studio',
    },
    {
      'icon': IconLogo.iconMusic,
      'title': 'YouTube Music',
    },
    {
      'icon': IconLogo.iconKids,
      'title': 'YouTube Kids',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...listWidget(context, list: account),
                ..._spaceDivider,
                ...listWidget(context, list: utilities),
                ..._spaceDivider,
                ...listWidget(context, list: settings),
                ..._spaceDivider,
                ...listWidget(
                  context,
                  list: youtube,
                  isLogo: true,
                ),
              ],
            ),
          ),
        ),
        const CustomText.bodySmall(
          'Chính sách quyền riêng tư • Điều khoản dịch vụ',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16)
      ],
    );
  }

  List<Widget> listWidget(
    BuildContext context, {
    required List<Map<String, String>> list,
    bool isLogo = false,
  }) {
    return list
        .map(
          (e) => InkWell(
            onTap: () {
              if (e['route'] != null && e['route']!.isNotEmpty) {
                MyApp.back(context);
                MyApp.to(context, e['route']);
              }
            },
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (isLogo) ...[
                    CustomIcon.logo(e['icon'] ?? '')
                  ] else ...[
                    CustomIcon(e['icon'] ?? '')
                  ],
                  const SizedBox(width: 8),
                  CustomText.bodyLarge(e['title'] ?? ''),
                ],
              ),
            ),
          ),
        )
        .toList();
  }

  List<Widget> get _spaceDivider => [
        const SizedBox(height: 6),
        const Divider(),
        const SizedBox(height: 6),
      ];
}
