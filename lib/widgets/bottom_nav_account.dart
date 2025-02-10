import 'package:flutter/material.dart';

class BottomNavAccount extends StatelessWidget {
  final PageController pageController;
  final int currentPageIndex;
  const BottomNavAccount(
      {super.key,
      required this.pageController,
      required this.currentPageIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pageController.jumpToPage(4),
      child: Container(
          height: 60,
          width: 60,
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
          child:
              Center(child: Icon(Icons.groups, color: Colors.white, size: 36))),
    );
  }
}
