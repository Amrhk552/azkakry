// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Azkar extends StatelessWidget {
  const Azkar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: Colors.yellow[300]),
      width: 150,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'أهلا بك في جنة الأذكار',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text('حرك إلى اليمين أو اليسار حتى تظهر لك الأذكار')
        ],
      ),
    );
  }
}
