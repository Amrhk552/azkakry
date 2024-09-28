// ignore_for_file: prefer_const_constructors

import 'package:azkary1/masbaha.dart';
import 'package:flutter/material.dart';

class focus extends StatefulWidget {
  const focus({super.key});

  @override
  State<focus> createState() => _focusState();
}

class _focusState extends State<focus> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, int>;
    int pageIndex = args['pageIndex'] ?? 0;
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          setState(() {
            db.counters[pageIndex] = db.counters[pageIndex] + 1;
            print(db.counters[pageIndex]);
            db.updateCount();
          });
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/pg1.jpg'), fit: BoxFit.fill)),
          child: ListView(
            children: [
              Container(
                height: 0.1 * MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Text(
                  'أنقر في أي مكان في الشاشة ليزداد العداد',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromRGBO(0, 0, 0, 0.834)),
                ),
              ),
              SizedBox(height: 0.05 * MediaQuery.of(context).size.height),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: 0.4 * MediaQuery.of(context).size.width,
                height: 0.25 * MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${db.azkar[pageIndex][0]}",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      "${db.azkar[pageIndex][1]}",
                      style: TextStyle(fontSize: 23),
                    )
                  ],
                ),
              ),
              Center(
                child: Text(
                  '${db.counters[pageIndex]}',
                  style: TextStyle(
                      fontSize: 60, color: Color.fromRGBO(0, 0, 0, 0.707)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
