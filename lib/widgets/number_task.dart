import 'package:flutter/material.dart';

class NumberTask extends StatefulWidget {
  final int id;
  final String objective;
  final int current;
  final int goal;

  const NumberTask({
    Key? super.key,
    required this.id,
    required this.objective,
    this.current = 0,
    required this.goal,
  });

  @override
  State<NumberTask> createState() => _TaskState();
}

class _TaskState extends State<NumberTask> {
  @override
  Widget build(BuildContext context) {
    return Row();
  }
}
