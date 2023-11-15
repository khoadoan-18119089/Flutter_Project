import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';
import 'package:youtube_clone/screens/trang_chu/components/danh_muc.dart';
import 'package:youtube_clone/screens/trang_chu/components/danh_sach_video.dart';
import 'package:youtube_clone/screens/trang_chu/controllers/danh_muc_controller.dart';
import 'package:youtube_clone/screens/trang_chu/controllers/danh_sach_video_controller.dart';

class TrangChuScreen extends StatelessWidget {
  const TrangChuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Wakelock.disable();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DanhMucController()),
        ChangeNotifierProvider(create: (_) => DanhSachVideoController()),
      ],
      builder: (_, __) {
        return Column(
          children: [
            DanhMuc(),
            Expanded(child: DanhSachVideo()),
          ],
        );
      },
    );
  }
}
