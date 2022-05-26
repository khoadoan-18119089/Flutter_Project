import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color Colour;
  final Widget? cardchild;
  final Function()? onTap;
  const ReusableCard({required this.Colour, this.cardchild, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardchild,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colour,
        ),
      ),
    );
  }
}
