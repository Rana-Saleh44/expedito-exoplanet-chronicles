import 'package:flutter/material.dart';

class QuizSecondQues extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgrounds/home.png',
              fit: BoxFit.cover,
            ),
          ),
          // Add other widgets here as needed
        ],
      ),
    );
  }
}
