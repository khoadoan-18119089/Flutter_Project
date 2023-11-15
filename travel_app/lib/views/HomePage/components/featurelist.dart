import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';
import '../state/homepageStateProvider.dart';

class TopFeaturedList extends StatefulWidget {
  const TopFeaturedList({super.key});

  @override
  _TopFeaturedListState createState() => _TopFeaturedListState();
}

class _TopFeaturedListState extends State<TopFeaturedList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
      height: 60,
      width: size.width,
      child: Consumer<HomePageStateProvider>(
        builder: (context, state, s) {
          return ListView.builder(
              itemCount: state.kTopListLink.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return TextButton(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: Text(state.kTopListLink[index],
                          style: kAppTheme.textTheme.headlineMedium?.merge(
                              TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kAppTheme.colorScheme.secondary))),
                    ),
                    onPressed: () {},
                  );
                }

                return TextButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Text(state.kTopListLink[index],
                        style: kAppTheme.textTheme.headlineMedium),
                  ),
                  onPressed: () {},
                );
              });
        },
      ),
    );
  }
}
