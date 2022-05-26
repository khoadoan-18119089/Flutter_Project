import 'package:flutter/material.dart';

class IconContext extends StatelessWidget {
  final IconData icons;
  final String laber;
  final Color colourText;
  const IconContext(
      {required this.icons, required this.colourText, required this.laber});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 80,
          color: colourText,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          laber,
          style: TextStyle(fontSize: 18, color: colourText),
        )
      ],
    );
  }
}
