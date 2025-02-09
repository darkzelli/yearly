import 'package:flutter/material.dart';
import 'package:yearly/pages/checklist.dart';
import 'package:yearly/pages/board.dart';
import 'package:yearly/pages/home.dart';
import 'package:yearly/pages/settings.dart';
import 'package:yearly/pages/circle.dart';

import 'package:yearly/widgets/bottom_nav.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  await dotenv.load(fileName: '.env');
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
                  Icon(Icons.expand_more)
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
