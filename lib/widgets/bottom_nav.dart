import 'package:flutter/material.dart';
import 'package:yearly/widgets/bottom_nav_main.dart';

class BottomNav extends StatelessWidget {
  final PageController pageController;
  final int currentPageIndex;
  const BottomNav(
      {Key? super.key,
      required this.pageController,
      required this.currentPageIndex});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: Row(children: [
        BottomNavMain(
            currentPageIndex: currentPageIndex, pageController: pageController)
      ]),
    );
  }
}
