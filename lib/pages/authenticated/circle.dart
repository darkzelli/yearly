import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // More spacing around the grid
        child: GridView.builder(
          shrinkWrap: true, // Prevents unnecessary scrolling
          physics: const NeverScrollableScrollPhysics(), // Disables internal scrolling
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 columns
            crossAxisSpacing: 30, // Increased spacing for better spread
            mainAxisSpacing: 55, // Increased spacing for better spread
          ),
          itemCount: 16, // 4x4 = 16 items
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print('Container $index tapped');
              },
              child: Container(
                padding: const EdgeInsets.all(10), // Padding inside each circle
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}