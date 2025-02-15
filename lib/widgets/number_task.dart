import 'package:flutter/material.dart';

class NumberTask extends StatefulWidget {
  final int id;
  final String objective;
  final int current;
  final int goal;

  const NumberTask({
    super.key,
    required this.id,
    required this.objective,
    this.current = 0,
    required this.goal,
  });

  @override
  State<NumberTask> createState() => _TaskState();
}

class _TaskState extends State<NumberTask> {
  int current;

  _TaskState() : current = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth * .06),
      child: Row(
        children: [
          IconButton(
            iconSize: 32,
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () {
              setState(() {
                current = current > 0 ? current - 1 : 0;
              });
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.objective,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      current.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: current >= widget.goal ? Color.fromRGBO(46, 109, 198, 1): Colors.black, // Change the color conditionally
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            iconSize: 32,
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {
              setState(() {
                current++;
              });
            },
          ),
        ],
      ),
    );
  }
}
