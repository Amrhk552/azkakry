// ignore_for_file: prefer_const_constructors

import 'package:azkary1/counter.dart';
import 'package:azkary1/foucs.dart';
import 'package:azkary1/homePage.dart';
import 'package:azkary1/masbaha.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
  var box = await Hive.openBox('mybox');
  var bxo2 = await Hive.openBox('countBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MaterialApp(
        routes: {
          'Masbaha': (context) => Masbaha(),
          'foucs': (context) => focus()
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.yellow,
            appBarTheme:
                AppBarTheme(backgroundColor: Colors.yellow, centerTitle: true)),
        home: homePage(),
      ),
    );
  }
}
