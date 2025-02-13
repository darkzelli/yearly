import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yearly/pages/authenticated/authenticated_controller.dart';
import 'package:yearly/pages/unauthenticated/login.dart';
import 'package:yearly/pages/unauthenticated/signup.dart';

class OnBoardScreening extends StatefulWidget {
  const OnBoardScreening({super.key});

  @override
  State<OnBoardScreening> createState() => _OnBoardScreeningState();
}

class _OnBoardScreeningState extends State<OnBoardScreening> {
final PageController _pageController = PageController();
 int currentPageIndex = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
             setState(() {
               currentPageIndex = value;
             });
            },
            children: [
              Container(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              Container(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              Container(
                color: Color.fromRGBO(255, 255, 255, 1),
              )
            ],
          ),
          Container(
            alignment: Alignment(0, 1),
            child: SmoothPageIndicator(
              controller: _pageController, 
              count: 3,
              effect: ExpandingDotsEffect(
                spacing: 20.0,
                dotColor: Color.fromRGBO(185, 196, 211, 1),
                activeDotColor: Color.fromRGBO(44, 132, 255, 1)
              ),
              )
          ),
        ]),
        bottomNavigationBar: 
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: screenWidth * .06),
            child: GestureDetector(
                onTap: (){
                  (currentPageIndex == 2) ?
                  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup())
                  ) :
                  _pageController.jumpToPage(currentPageIndex + 1);
                },
                child: Container(
                  height: 65,
                  width: screenWidth * 0.70,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(44, 132, 255, 1),
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
                  child: Center(
                    child: (currentPageIndex == 2) ? 
                        Text("Get Started", 
                          style: TextStyle(color: Colors.white, 
                          fontSize: 20, 
                        fontWeight: FontWeight.w600)
                        ) :
                        Text("Next", 
                           style: TextStyle(color: Colors.white, 
                           fontSize: 20, 
                           fontWeight: FontWeight.w600)
                         )
                    ),
                  ),
            ),
          )
    );
  }
}