import 'package:flutter/material.dart';

import '../constants/strings.dart';

AppBar homeAppBar = AppBar(
  title: const Text(
    "Discover",
    style: TextStyle(
      fontWeight: FontWeight.w900,
      letterSpacing: 2,
      color: Colors.black,
    ),
  ),
  centerTitle: true,
  leading: PopupMenuButton(
    offset: Offset.fromDirection(2, 58),
    onSelected: (value) {},
    icon: const Icon(
      Icons.menu,
      color: Colors.black,
    ),
    itemBuilder: (context) {
      return kAppBarMenuOptions
          .map(
            (option) => PopupMenuItem(
              value: option,
              child: SizedBox(
                width: 120,
                child: Text(
                  option,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          )
          .toList();
    },
  ),
  actions: [
    IconButton(
        icon: const Icon(
          Icons.account_circle,
          size: 36,
          color: Colors.black,
        ),
        onPressed: () {})
  ],
);
