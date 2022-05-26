import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function() onpress;
  const RoundIconButton({required this.iconData, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        iconData,
      ),
      elevation: 0,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF1C2033),
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      onPressed: onpress,
    );
  }
}
