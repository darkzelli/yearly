import 'package:flutter/material.dart';
import 'package:yearly/pages/authenticated/checklist.dart';
import 'package:yearly/pages/authenticated/board.dart';
import 'package:yearly/pages/authenticated/home.dart';
import 'package:yearly/pages/authenticated/settings.dart';
import 'package:yearly/pages/authenticated/circle.dart';
import 'package:yearly/widgets/bottom_nav.dart';

class AuthenticatedController extends StatefulWidget {
  const AuthenticatedController({super.key});

  @override
  State<AuthenticatedController> createState() => _AuthenticatedControllerState();
}

class _AuthenticatedControllerState extends State<AuthenticatedController> {
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
        return 'Settings';
      case 4:
        return 'Circle';
      default:
        return 'Home';
    }
  }

  String navTitle = 'Home';

  int currentPageIndex = 0;

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
              children: const [
                Home(),
                Checklist(),
                Board(),
                Settings(),
                Circle()
              ],
            ),
            appBar: AppBar(
              title: GestureDetector(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(navTitle,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1)),
                ]),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            extendBody: true,
            bottomNavigationBar: BottomNav(
                currentPageIndex: currentPageIndex,
                pageController: _pageController)));
  }
}
