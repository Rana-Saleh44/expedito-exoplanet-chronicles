import 'package:flutter/material.dart';

class QuizFirstQues extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
          // Content
          Column(
            children: [
              // Stack to overlay images
              Stack(
                children: [
                  // Top Background Image (Fixed)
                  Image.asset(
                    'assets/images/q1/background.png',
                    width: screenWidth,
                    height: screenHeight * 0.15,
                    fit: BoxFit.cover,
                  ),
                  // Top Frame Image (On top of the background image)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/q1/top_frame.png',
                      width: screenWidth,
                      height: screenHeight * 0.1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              // Question Image (Fixed)
              Image.asset(
                'assets/images/q1/ques1.png',
                width: screenWidth,
                height: screenHeight * 0.2,
                fit: BoxFit.cover,
              ),
              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Answer 1 Image
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                        child: Image.asset(
                          'assets/images/q1/a1.png',
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.1,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Answer 2 Image
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                        child: Image.asset(
                          'assets/images/q1/a2.png',
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.1,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Answer 3 Image
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                        child: Image.asset(
                          'assets/images/q1/a3.png',
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.1,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Answer 4 Image
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                        child: Image.asset(
                          'assets/images/q1/a4.png',
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.1,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Next Button Image
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.02),
                        child: Image.asset(
                          'assets/images/q1/next.png',
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.08,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
