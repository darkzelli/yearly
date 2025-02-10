import 'package:flutter/material.dart';
import 'package:yearly/widgets/check_task.dart';
import 'package:yearly/widgets/number_task.dart';
import 'package:yearly/widgets/task_group.dart';

class Checklist extends StatefulWidget {
  const Checklist({super.key});

  @override
  State<Checklist> createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  List tasksGroup = [
    TaskGroup(title: 'school', tasks: [
      CheckTask(id: 1, objective: 'go to school'),
      CheckTask(id: 1, objective: 'go to school'),
      CheckTask(id: 1, objective: 'go to school'),
      CheckTask(id: 1, objective: 'go to school'),
      CheckTask(id: 1, objective: 'go to school'),
      CheckTask(id: 1, objective: 'go to school')
    ]),
    TaskGroup(title: 'work', tasks: [
      CheckTask(id: 1, objective: 'go into work'),
      CheckTask(id: 1, objective: 'go into work'),
      CheckTask(id: 1, objective: 'go into work'),
      CheckTask(id: 1, objective: 'go into work'),
      CheckTask(id: 1, objective: 'go into work'),
      CheckTask(id: 1, objective: 'go into work')
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
            itemCount: tasksGroup.length,
            itemBuilder: (context, index) {
              return Container(
                child: tasksGroup[index],
              );
            }));
  }
}
