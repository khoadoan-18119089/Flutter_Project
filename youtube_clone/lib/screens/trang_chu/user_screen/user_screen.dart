import 'package:flutter/material.dart';
import 'package:youtube_clone/screens/trang_chu/user_screen/body_user.dart';
import 'package:youtube_clone/common_components/custom_icon.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const CustomIcon(Icons.close_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: BodyUser(),
    );
  }
}
