// ignore_for_file: prefer_const_constructors

import 'package:azkary1/utli/button.dart';
import 'package:flutter/material.dart';

class dialogBox extends StatelessWidget {
  final controller;
  final VoidCallback cancel;
  final VoidCallback save;
  const dialogBox(
      {super.key,
      required this.controller,
      required this.cancel,
      required this.save});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(177, 255, 238, 88),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'أضف ما تريد'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "save", onPpressed: save),
                SizedBox(
                  width: 10,
                ),
                MyButton(text: "cancel", onPpressed: cancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
