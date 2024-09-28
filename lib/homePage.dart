// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:azkary1/data/database.dart';
import 'package:azkary1/utli/dialogBox.dart';
import 'package:azkary1/utli/todoTile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final _controller = TextEditingController();

  final tododatabase db = tododatabase();
  final _mybox = Hive.box('mybox');
  @override
  void initState() {
    // if this is the first time openning the app
    if (_mybox.get('TODO') == null) {
      db.createdata();
    } else {
      // there is already exsist data so
      db.loaddata();
    }

    super.initState();
  }

  void addTask(context) {
    showDialog(
        context: context,
        builder: (context) {
          return dialogBox(
              controller: _controller,
              cancel: () => Navigator.of(context).pop(),
              save: () {
                setState(() {
                  db.todo.add([_controller.text, false]);
                  _controller.clear();
                  db.updatedata();
                });
                Navigator.of(context).pop();
              });
        });
  }

  bool ischeck = false;
  bool NightMood = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        leading: TextButton(
            onPressed: () {
              print('object');
              if (ischeck) {
                for (int i = 0; i < db.todo.length; i++) {
                  setState(() {
                    db.todo[i][1] = false;
                  });
                }
                ischeck = false;
              } else {
                for (int i = 0; i < db.todo.length; i++) {
                  setState(() {
                    db.todo[i][1] = true;
                  });
                }
                ischeck = true;
              }
              db.updatedata();
            },
            child: Text(
              ischeck ? 'Uncheck all' : 'check all',
              style: TextStyle(color: Colors.black, fontSize: 10),
            )),
        actions: [
          MaterialButton(
              child: Image.asset('images/mas.jpg'),
              onPressed: () {
                Navigator.pushNamed(context, 'Masbaha',
                    arguments: {'NightMood': NightMood});
              }),
        ],
        title: Text(
          'لائحة المهام',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
        onPressed: () {
          setState(() {
            addTask(context);
          });
        },
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    NightMood ? 'images/alghaith2.jpg' : 'images/pg1.jpg'),
                opacity: 1)),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      NightMood ? 'images/alghaith3.jpg' : 'images/33.jpg'),
                  fit: BoxFit.cover)),
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: db.todo.length,
            itemBuilder: (context, index) {
              return todoTile(
                taskName: db.todo[index][0],
                taskCom: db.todo[index][1],
                onChanged: (value) {
                  setState(() {
                    db.todo[index][1] = !db.todo[index][1];
                    db.updatedata();
                  });
                },
                deleteTask: (Context) {
                  setState(() {
                    db.todo.removeAt(index);
                    db.updatedata();
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
