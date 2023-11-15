import 'package:flutter/material.dart';

import '../list_title_general.dart';

class Bedtime extends StatelessWidget {
  const Bedtime({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralListTitle(
      title: 'Nhắc tôi khi đến giờ đi ngủ',
      isSwitch: true,
      show: (title) => const SizedBox(),
    );
  }
}
