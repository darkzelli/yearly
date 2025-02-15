import 'package:flutter/material.dart';
import 'package:yearly/widgets/check_task.dart';
import 'package:yearly/widgets/number_task.dart';
import 'package:yearly/widgets/task_group.dart';
import 'package:yearly/widgets/year_selector.dart';

class Checklist extends StatefulWidget {
  const Checklist({super.key});

  @override
  State<Checklist> createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  final _searchController = TextEditingController();

  void search() async{
    final searchQuery =  _searchController.text;
  }
  List tasksGroup = [
    TaskGroup(title: 'school', tasks: [
      NumberTask(id: 1, objective: 'aaah', goal: 5),
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
        child: Column(
           children: [
            YearSelector(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth * .04),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      // Add your filter action here
                    },
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50, // Set the desired height here
                      width: screenWidth * 0.7, // Set the desired width here
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(vertical: 10), // Adjust vertical padding to center content
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // Add your filter action here
                    },
                  ),
                ],
              ),
            ),
            Container(height: 16, color: Colors.transparent,), // Add vertical space
            Expanded( // Allow ListView to take remaining space
              child: ListView.builder(
                itemCount: tasksGroup.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Add spacing between items
                    child: Container(
                      child: tasksGroup[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
