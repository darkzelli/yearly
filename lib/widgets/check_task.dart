import 'package:flutter/material.dart';

class CheckTask extends StatefulWidget {
  final int id;
  final String objective;

  const CheckTask({
    Key? super.key,
    required this.id,
    required this.objective,
  });

  @override
  State<CheckTask> createState() => _TaskState();
}

class _TaskState extends State<CheckTask> {
  bool isCompleted = true;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth * .08),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the child horizontally
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isCompleted = !isCompleted;
              });
            },
            child: Container(
                height: 50,
                width: screenWidth * 0.70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(172, 159, 159, .3),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: Offset(0, -2), // Raised from bottom
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: screenWidth * .04),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.objective,
                            overflow: TextOverflow.fade,
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        !isCompleted
                            ? Icon(Icons.check_box_outline_blank,
                                color: Colors.black)
                            : Container()
                      ]),
                )),
          ),
          Spacer(),
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 107, 255, 1),
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(172, 159, 159, .3),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: Offset(0, -2), // Raised from bottom
                  ),
                ],
              ),
              child: Center(child: Icon(Icons.check, color: Colors.white)))
        ],
      ),
    );
  }
}
