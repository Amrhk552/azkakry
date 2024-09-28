// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: camel_case_types
class todoTile extends StatelessWidget {
  final String taskName;
  final bool taskCom;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;
  todoTile(
      {super.key,
      required this.taskName,
      required this.taskCom,
      required this.onChanged,
      required this.deleteTask});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(12),
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.yellow[500]),
          child: Row(
            children: [
              Checkbox(
                value: taskCom,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCom
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )
            ],
          ),
        ),
      ),
    );
  }
}
