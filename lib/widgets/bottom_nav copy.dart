import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final PageController pageController;
  final int currentPageIndex;
  const BottomNav(
      {Key? super.key,
      required this.pageController,
      required this.currentPageIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Container(
          height: 75,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => pageController.jumpToPage(0),
                icon: Icon(
                  Icons.home,
                  color: (currentPageIndex == 0)
                      ? const Color.fromRGBO(0, 107, 255, 1)
                      : const Color.fromRGBO(174, 182, 173, 1),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () => pageController.jumpToPage(1),
                icon: Icon(
                  Icons.check_box_outlined,
                  color: (currentPageIndex == 1)
                      ? const Color.fromRGBO(0, 107, 255, 1)
                      : const Color.fromRGBO(174, 182, 173, 1),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () => pageController.jumpToPage(2),
                icon: Icon(
                  Icons.remove_red_eye,
                  color: (currentPageIndex == 2)
                      ? const Color.fromRGBO(0, 107, 255, 1)
                      : const Color.fromRGBO(174, 182, 173, 1),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () => pageController.jumpToPage(3),
                icon: Icon(
                  Icons.person,
                  color: (currentPageIndex == 3)
                      ? const Color.fromRGBO(0, 107, 255, 1)
                      : const Color.fromRGBO(174, 182, 173, 1),
                  size: 30,
                ),
              ),
            ],
          ),
        ));
  }
}
