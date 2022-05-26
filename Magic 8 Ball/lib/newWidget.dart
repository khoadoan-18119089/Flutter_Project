import 'package:flutter/material.dart';
import 'abc.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4CA2F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3158AB),
        centerTitle: true,
        title: const Text(
          'Ask Me Anything',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: const Abc(),
    );
  }
}
