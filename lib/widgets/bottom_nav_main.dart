import 'package:flutter/material.dart';

class BottomNavMain extends StatelessWidget {
  final PageController pageController;
  final int currentPageIndex;
  const BottomNavMain(
      {Key? super.key,
      required this.pageController,
      required this.currentPageIndex});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        height: 75,
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
          padding:
              EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth * .04),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
              onPressed: () => pageController.jumpToPage(0),
              icon: Icon(
                Icons.home,
                color: (currentPageIndex == 0)
                    ? const Color.fromRGBO(0, 107, 255, 1)
                    : const Color.fromRGBO(174, 182, 173, 1),
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () => pageController.jumpToPage(1),
              icon: Icon(
                Icons.list,
                color: (currentPageIndex == 1)
                    ? const Color.fromRGBO(0, 107, 255, 1)
                    : const Color.fromRGBO(174, 182, 173, 1),
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () => pageController.jumpToPage(2),
              icon: Icon(
                Icons.remove_red_eye,
                color: (currentPageIndex == 2)
                    ? const Color.fromRGBO(0, 107, 255, 1)
                    : const Color.fromRGBO(174, 182, 173, 1),
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () => pageController.jumpToPage(3),
              icon: Icon(
                Icons.settings,
                color: (currentPageIndex == 3)
                    ? const Color.fromRGBO(0, 107, 255, 1)
                    : const Color.fromRGBO(174, 182, 173, 1),
                size: 32,
              ),
            ),
          ]),
        ));
  }
}
