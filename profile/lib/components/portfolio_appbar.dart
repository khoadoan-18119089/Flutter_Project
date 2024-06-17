import 'package:flutter/material.dart';

class PortfolioAppbar extends AppBar {
  PortfolioAppbar({super.key})
      : super(
          leading: const ImageIcon(
            AssetImage("assets/logo/flutter_logo.png"),
          ),
        );
}
