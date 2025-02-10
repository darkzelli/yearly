import 'package:flutter/material.dart';
import 'package:yearly/widgets/bottom_nav_account.dart';
import 'package:yearly/widgets/bottom_nav_main.dart';

class BottomNav extends StatelessWidget {
  final PageController pageController;
  final int currentPageIndex;
  const BottomNav(
      {super.key,
      required this.pageController,
      required this.currentPageIndex});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 55, horizontal: screenWidth * .06),
      child: Row(children: [
        BottomNavMain(
            currentPageIndex: currentPageIndex, pageController: pageController),
        Spacer(),
        BottomNavAccount(
            currentPageIndex: currentPageIndex, pageController: pageController)
      ]),
    );
  }
}
