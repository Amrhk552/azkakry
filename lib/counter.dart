// ignore_for_file: camel_case_types

import 'package:azkary1/data/database.dart';
import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  final tododatabase db = tododatabase();
  List<int> _counters = [];
  List _azkar = [];
  void add(int pageIndex) {
    db.counters[pageIndex] = db.counters[pageIndex] + 1;
    print(db.counters[pageIndex]);
    db.updateCount();
  }

  void rest(int pageIndex) {
    db.counters[pageIndex] = 0;
    db.updateCount();
  }
}
