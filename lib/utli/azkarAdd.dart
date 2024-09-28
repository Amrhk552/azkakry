// ignore_for_file: prefer_const_constructors

import 'package:azkary1/utli/button.dart';
import 'package:flutter/material.dart';

class azkarAdd extends StatelessWidget {
  final controller1;
  final controller2;

  final VoidCallback cancel;
  final VoidCallback save;
  const azkarAdd(
      {super.key,
      required this.controller1,
      required this.controller2,
      required this.cancel,
      required this.save});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(177, 255, 238, 88),
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              cursorColor: Colors.black,
              controller: controller1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'أضف الذكر الذي تريده'),
            ),
            TextField(
              cursorColor: Colors.black,
              controller: controller2,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'عدد التكرارات'),
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
