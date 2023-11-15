import 'package:flutter/material.dart';

class TabbarSkeleton extends StatelessWidget {
  const TabbarSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return getSkeletonView(context);
  }

  Widget getSkeletonView(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double widthItem = 100;
            final double width = constraints.maxWidth != double.infinity
                ? constraints.maxWidth
                : widthItem;
            double height = 36;
            if (widthItem > width) {
              widthItem = width;
            }
            final int count = width ~/ widthItem;
            return SizedBox(
              height: height,
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => const SizedBox(
                  width: 8,
                ),
                itemCount: count,
                itemBuilder: (_, __) => Container(
                  height: height,
                  width: widthItem,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).cardTheme.color,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}