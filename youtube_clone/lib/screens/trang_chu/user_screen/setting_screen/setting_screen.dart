import 'package:flutter/material.dart';
import 'package:youtube_clone/main.dart';
import 'package:youtube_clone/common_components/custom_text.dart';
import 'package:youtube_clone/my_app/routers/views.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final List<Map<String, String>> settings = [
    {
      'title': 'Chung',
      'route': Views.general.path
    },
    {
      'title': 'Tiết kiệm dữ liệu',
    },
    {
      'title': 'Tự động phát',
    },
    {
      'title': 'Lựa chọn ưu tiên về chất lượng video',
    },
    {
      'title': 'Nội dung tải xuống',
    },
    {
      'title': 'Xem trên TV',
    },
    {
      'title': 'Quản lý toàn bộ nhật ký hoạt động',
    },
    {
      'title': 'Quyền riêng tư',
    },
    {
      'title': 'Thử tính năng mới',
    },
    {
      'title': 'Giao dịch mua và gói thành viên',
    },
    {
      'title': 'Lập hóa đơn và thanh toán',
    },
    {
      'title': 'Thông báo',
    },
    {
      'title': 'Ứng dụng đã kết nối',
    },
    {
      'title': 'Trò chuyện trực tiếp',
    },
    {
      'title': 'Phụ đề',
    },
    {
      'title': 'Hỗ trợ tiếp cận',
    },
    {
      'title': 'Giới thiệu',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Cài đặt'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: settings
            .map(
              (e) => _textButton(context, map: e),
            )
            .toList(),
      ),
    );
  }

  Widget _textButton(
    BuildContext context, {
    required Map<String, String> map,
  }) {
    return InkWell(
      onTap: () {
        if (map['route'] != null && map['route']!.isNotEmpty) {
          MyApp.to(context, map['route']);
        }
      },
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: CustomText.bodyLarge(map['title'] ?? ''),
      ),
    );
  }
}
