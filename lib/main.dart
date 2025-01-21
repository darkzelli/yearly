import 'package:flutter/material.dart';
import 'package:yearly/pages/checklist.dart';
import 'package:yearly/pages/board.dart';
import 'package:yearly/pages/home.dart';
import 'package:yearly/pages/settings.dart';
import 'dart:ui';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  String calculateTitle(page) {
    switch (page) {
      case 0:
        return 'Home';
      case 1:
        return 'Yearly';
      case 2:
        return 'Vision Board';
      case 3:
        return 'Account';
      default:
        return 'Home';
    }
  }

  String navTitle = 'Home';

  int currentPageIndex = 0;

  void navButtonPressed(pageIndex) {
    _pageController.jumpToPage(pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            currentPageIndex = page;
          });
          navTitle = calculateTitle(page);
        },
        children: const [Home(), Checklist(), Board(), Settings()],
      ),
      appBar: AppBar(
          title: Text(navTitle,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: currentPageIndex == 1
              ? IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
              : Container(),
          actions: [
            currentPageIndex == 1
                ? IconButton(onPressed: () {}, icon: Icon(Icons.add))
                : Container(),
          ]),
      extendBody: true,
      bottomNavigationBar: Padding(
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
                  onPressed: () => navButtonPressed(0),
                  icon: Icon(
                    Icons.home,
                    color: (currentPageIndex == 0)
                        ? const Color.fromRGBO(0, 107, 255, 1)
                        : const Color.fromRGBO(174, 182, 173, 1),
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => navButtonPressed(1),
                  icon: Icon(
                    Icons.check_box_outlined,
                    color: (currentPageIndex == 1)
                        ? const Color.fromRGBO(0, 107, 255, 1)
                        : const Color.fromRGBO(174, 182, 173, 1),
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => navButtonPressed(2),
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: (currentPageIndex == 2)
                        ? const Color.fromRGBO(0, 107, 255, 1)
                        : const Color.fromRGBO(174, 182, 173, 1),
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => navButtonPressed(3),
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
          )),
    ));
  }
}
