import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travel_app/components/rating,.dart';

class ViewDetails extends StatefulWidget {
  const ViewDetails({super.key});

  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  int numberPackage = 0;

  removePackage() {
    setState(() {
      numberPackage--;
      numberPackage = max(numberPackage, 0);
    });
  }

  addPackage() {
    setState(() {
      numberPackage++;
      numberPackage = min(numberPackage, 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData appTheme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.menu),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: size.height * 0.7,
              color: Colors.grey,
              child: const Image(
                image: AssetImage('assets/image/pic1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 26, left: 20, right: 20),
                height: size.height * 0.54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mount Fuji", style: appTheme.textTheme.displayMedium),
                    const SizedBox(height: 4),
                    Row(children: [
                      const Icon(
                        Icons.location_pin,
                        size: 14,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "Honshu, Japan",
                        style: appTheme.textTheme.bodySmall,
                      )
                    ]),
                    const SizedBox(height: 8),
                    ratingStart(rating: 4.5, color: Colors.black),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: appTheme.colorScheme.secondary,
                            ),
                            splashColor: appTheme.colorScheme.secondary,
                            onPressed: () {
                              removePackage();
                            }),
                        Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Text(
                            numberPackage.toString(),
                            style: appTheme.textTheme.bodySmall,
                          ),
                        ),
                        IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              addPackage();
                            }),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.timer_rounded,
                          color: appTheme.colorScheme.secondary,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "5 Days",
                          style: appTheme.textTheme.bodySmall?.merge(
                              TextStyle(color: appTheme.colorScheme.secondary)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Description",
                      style: appTheme.textTheme.displaySmall!
                          .merge(const TextStyle(color: Colors.black)),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: appTheme.textTheme.bodyLarge,
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "\$400",
                                style: TextStyle(
                                    color: appTheme.colorScheme.secondary,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "/Package",
                                style: TextStyle(
                                    color: appTheme.colorScheme.secondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                // backgroundColor: appTheme.accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 0,
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'PlayFair',
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Book Now",
                                style: appTheme.textTheme.displaySmall,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
