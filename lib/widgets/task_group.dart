import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:yearly/widgets/check_task.dart';
import 'package:yearly/widgets/number_task.dart';

class TaskGroup extends StatelessWidget {
  final String title;
  final List tasks;
  const TaskGroup({Key? super.key, required this.title, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          height: 30,
          width: screenWidth * 0.70 + 50,
          child: Text(title,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              )),
        ),
        ...tasks,
      ])),
    );
  }
}
