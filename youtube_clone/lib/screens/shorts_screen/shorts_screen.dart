import 'package:flutter/material.dart';
import 'package:youtube_clone/screens/shorts_screen/components/danh_sach_short.dart';
import 'package:youtube_clone/screens/shorts_screen/components/short_appbar.dart';

class ShortsScreen extends StatelessWidget {
  const ShortsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DanhSachShort(),
          const ShortAppbar(),
        ],
      ),
    );
  }
}
