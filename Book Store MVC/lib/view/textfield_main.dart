import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFiledMain extends StatelessWidget {
  final String hintText;
  final IconData iconFiled;
  final TextEditingController textController;
  final bool typePassword;
  const TextFiledMain({
    Key? key,
    required this.hintText,
    required this.iconFiled,
    required this.textController,
    this.typePassword=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 20, top: 3.h, bottom: 5),
      child: TextField(
        style: TextStyle(color: Colors.black),
        controller: textController,
        obscureText: typePassword,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            iconFiled,
            color: Colors.black,
          ),
          filled: true,
          isDense: true,
          hintStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }
}
