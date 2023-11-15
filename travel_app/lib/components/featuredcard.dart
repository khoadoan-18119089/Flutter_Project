import 'dart:math';

import 'package:flutter/material.dart';

import '../models/placesModel.dart';
import '../theme.dart';
import 'rating,.dart';

class FeaturedCard extends StatefulWidget {
  PlaceModel placeModel;

  FeaturedCard({super.key, required this.placeModel});

  @override
  _FeaturedCardState createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<FeaturedCard> {
  double rating = 0.0;
  String title = '';
  late bool favorite;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ThemeData appTheme = Theme.of(context);

    return Container(
        width: size.width * 0.85,
        height: max(200, size.height * 0.32),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.grey.withAlpha(90)),
        child: Stack(
          children: [
            SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image(
                  image: AssetImage(widget.placeModel.imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 8, top: 8),
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.black.withAlpha(95)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 28,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.placeModel.placeTitle,
                            style: kAppTheme.textTheme.displaySmall,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.favorite_rounded,
                                color: kAppTheme.primaryColor,
                              ),
                              onPressed: () {})
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          ratingStart(rating: widget.placeModel.rating)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
