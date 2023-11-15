import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/common/field_name.dart';
import 'package:youtube_clone/common_components/custom_text.dart';
import 'package:youtube_clone/my_app/controllers/theme_controller/theme_controller.dart';

class TabBarCusTom extends StatefulWidget {
  const TabBarCusTom({
    super.key,
    this.controller,
    this.theFirst,
    required this.list,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });
  final TabController? controller;

  final EdgeInsetsGeometry padding;

  final List<Map<String, Object?>?> list;

  final void Function(int)? onTap;

  final Widget? theFirst;

  @override
  State<TabBarCusTom> createState() => _TabBarCustomState();
}

class _TabBarCustomState extends State<TabBarCusTom> {
  List<GlobalKey> keys = [];

  bool isButonTap = false;

  ScrollController scrollController = ScrollController();

  late TabController? tabController;

  late Widget? theFirst;

  late int currentIndex;

  late int length;

  bool _isSelected(int index) {
    return currentIndex == index;
  }

  void scrollTo(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double tabBarWidth =
          MediaQuery.of(context).size.width - widget.padding.horizontal;
      RenderBox renderBox =
          keys[index].currentContext?.findRenderObject() as RenderBox;
      double itemWidth = renderBox.size.width;
      double position = renderBox.localToGlobal(Offset.zero).dx;
      double offset = (position + itemWidth / 2) - tabBarWidth / 2;

      if (offset < 0) {
        position > offset
            ? offset +=
                (scrollController.offset - widget.padding.horizontal / 2)
            : offset = 0.0;
      } else {
        offset += (scrollController.offset - widget.padding.horizontal / 2);
        if (offset >= scrollController.position.maxScrollExtent) {
          offset = scrollController.position.maxScrollExtent;
        }
      }
      scrollController.animateTo(offset,
          duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
    });
  }

  void animation() {
    double aniValue = tabController!.animation!.value;
    if (!isButonTap) {
      setCurrentIndex(aniValue.round());
    }
    if (tabController!.index == aniValue.round()) {
      isButonTap = false;
    }
  }

  @override
  void initState() {
    tabController = widget.controller;
    theFirst = widget.theFirst;
    currentIndex = theFirst == null ? 0 : 1;
    length = theFirst == null ? widget.list.length : widget.list.length + 1;
    for (int i = 0; i < length; i++) {
      keys.add(GlobalKey(debugLabel: i.toString()));
    }
    tabController?.animation!.addListener(animation);
    super.initState();
  }

  @override
  void dispose() {
    tabController?.removeListener(animation);
    super.dispose();
  }

  void setCurrentIndex(int index) {
    if (currentIndex != index) {
      setState(() {
        currentIndex = index;
      });
      tabController?.animateTo(index);
      scrollTo(index);
    }
  }

  final _keyList = GlobalKey(debugLabel: 'TabBar');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        key: _keyList,
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        padding: widget.padding,
        itemCount: length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, index) {
          if (theFirst != null && index == 0) return itemFirst();
          return item(index);
        },
      ),
    );
  }

  Widget itemFirst() {
    return Container(
      key: keys[0],
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: _unSelect(),
      ),
      child: theFirst,
    );
  }

  Widget item(int index) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        isButonTap = true;
        setCurrentIndex(index);
        if (widget.onTap != null) {
          widget.onTap!.call(widget.list[index]?[fieldId] as int);
        }
      },
      child: Container(
        key: keys[index],
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: _isSelected(index) ? _select() : _unSelect(),
        ),
        child: CustomText.bodyMedium(
          widget.list[index]?[fieldTitle] as String,
          color: _isSelected(index) ? _colorSelect : null,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Color get _colorSelect => Theme.of(context).scaffoldBackgroundColor;


  Color _select() {
    final watch = context.watch<ThemeController>();
    Color color = Theme.of(context).scaffoldBackgroundColor;
    switch (watch.themeMode) {
      case ThemeMode.system:
        if (color == Colors.white) {
          return Colors.black;
        }
        return Colors.white;
      case ThemeMode.light:
        return Colors.black;
      case ThemeMode.dark:
        return Colors.white;
    }
  }

  Color _unSelect() {
    final watch = context.watch<ThemeController>();
    Color color = Theme.of(context).scaffoldBackgroundColor;
    switch (watch.themeMode) {
      case ThemeMode.system:
        if (color == Colors.white) {
          return Colors.grey.shade300;
        }
        return Colors.grey.shade900;
      case ThemeMode.light:
        return Colors.grey.shade300;
      case ThemeMode.dark:
        return Colors.grey.shade900;
    }
  }
}
