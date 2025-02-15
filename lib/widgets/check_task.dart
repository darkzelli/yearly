import 'package:flutter/material.dart';

class CheckTask extends StatefulWidget {
  final int id;
  final String objective;

  const CheckTask({
    super.key,
    required this.id,
    required this.objective,
  });

  @override
  State<CheckTask> createState() => _TaskState();
}

class _TaskState extends State<CheckTask> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth * .06),
      child: Row(
        children: [
          IconButton(
            iconSize: 32,
            icon: Icon(Icons.info_outline),
            onPressed: () {
              // Add your info action here
            },
          ),
          Expanded(
            child: SizedBox(
              height: 50, // Set the desired height here
              width: screenWidth * 0.7, // Set the desired width here
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth * .04), // Adjust padding to center content
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.objective,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            iconSize: 32,
            icon: isCompleted
                ? Icon(Icons.check_circle, color: Color.fromRGBO(44, 132, 255, 1))
                : Icon(Icons.radio_button_unchecked),
            onPressed: () {
              setState(() {
                isCompleted = !isCompleted;
              });
            },
          ),
        ],
      ),
    );
  }
}
