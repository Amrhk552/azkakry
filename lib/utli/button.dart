import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPpressed;

  MyButton({super.key, required this.text, required this.onPpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPpressed,
      color: const Color.fromARGB(119, 255, 241, 118),
      child: Text(text),
    );
  }
}
