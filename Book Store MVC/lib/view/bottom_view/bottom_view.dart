import 'package:ebook_app/view/bottom_view/bottom_favorite.dart';
import 'package:ebook_app/view/bottom_view/bottom_library.dart';
import 'package:ebook_app/view/bottom_view/bottom_profile.dart';
import 'package:ebook_app/view/bottom_view/bottom_home.dart';
import 'package:flutter/material.dart';

class BottomView extends StatefulWidget {
  BottomView({Key? key}) : super(key: key);

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  int currentIndex = 0;
  List<Widget> body = [
    Home(),
    BotttomLibrary(),
    BotttomFavorite(),
    BotttomProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
         body: body[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTapBottomView,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Library'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: 'Favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
          ],
          
        ),
      ),
    );
  }

  void onTapBottomView(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
