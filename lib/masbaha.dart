// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:azkary1/counter.dart';
import 'package:azkary1/utli/azkarAdd.dart';

import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'data/database.dart';

class Masbaha extends StatefulWidget {
  const Masbaha({super.key});

  @override
  State<Masbaha> createState() => _MasbahaState();
}

final azkarController1 = TextEditingController();
final azkarcontroller2 = TextEditingController();
final tododatabase db = tododatabase();
final _mybox = Hive.box('mybox');

class _MasbahaState extends State<Masbaha> {
  AssetImage assetImagepg = AssetImage('images/pg1.jpg');
  int pageIndex = 0;
  @override
  void initState() {
    // if this is the first time openning the app
    if (_mybox.get('COUNT') == null) {
    } else {
      // there is already exsist data so
      Counter().db.loadcount();
    }
    if (_mybox.get('AZKAR') == null) {
      Counter().db.createazkar();
    } else {
      Counter().db.loadazkar();
    }
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    Color? mainColor = Colors.yellow[200];
    return Consumer<Counter>(
      builder: (context, counter, child) {
        return Scaffold(
            appBar: AppBar(
              actions: [
                MaterialButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return azkarAdd(
                                  controller1: azkarController1,
                                  controller2: azkarcontroller2,
                                  cancel: () => Navigator.of(context).pop(),
                                  save: () {
                                    setState(() {
                                      counter.db.azkar.add([
                                        azkarController1.text,
                                        azkarcontroller2.text
                                      ]);

                                      counter.db.counters.add(0);
                                      counter.db.updateCount();
                                      azkarController1.clear();
                                      azkarcontroller2.clear();
                                      counter.db.updateazkar();
                                      Navigator.of(context).pop();
                                    });
                                  });
                            });
                      });
                    }),
                MaterialButton(
                    child: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      setState(() {
                        counter.db.azkar.removeAt(pageIndex);
                        counter.db.counters.removeAt(pageIndex);
                        counter.db.updateCount();
                        counter.db.updateazkar();
                      });
                    })
              ],
            ),
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/pg1.jpg'),
                        fit: BoxFit.cover,
                        opacity: 0.6)),
                child: ListView(
                  children: [
                    Container(
                      color: mainColor,
                      margin: EdgeInsets.symmetric(
                          horizontal: 0.3 * MediaQuery.of(context).size.width,
                          vertical: 8),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'foucs', arguments: {
                            'pageIndex': pageIndex,
                          });
                        },
                        child: Text(
                          'وضع التركيز',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
                    SizedBox(
                      height: 0.4 * MediaQuery.of(context).size.height,
                      child: PageView.builder(
                        clipBehavior: Clip.antiAlias,
                        onPageChanged: (index) {
                          pageIndex = index;
                        },
                        itemCount: counter.db.azkar.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return ListView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(color: mainColor),
                                width: 0.4 * MediaQuery.of(context).size.width,
                                height:
                                    0.25 * MediaQuery.of(context).size.height,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${counter.db.azkar[index][0]}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                    Text(
                                      "${counter.db.azkar[index][1]}",
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height:
                                    0.15 * MediaQuery.of(context).size.height,
                                child: Text(
                                  '${counter.db.counters[index]}',
                                  style: TextStyle(
                                      fontSize: 50, color: Colors.black),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 0.1 * MediaQuery.of(context).size.height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          height: 40,
                          minWidth: 40,
                          onPressed: () {
                            counter.add(pageIndex);
                          },
                          color: mainColor,
                          child: Icon(
                            Icons.restart_alt_rounded,
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            counter.rest(pageIndex);
                          },
                          height: 60,
                          minWidth: 40,
                          child: Icon(
                            Icons.add_box,
                            size: 170,
                            color: mainColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                )));
      },
    );
  }
}
