import 'package:expedito_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart'; // Import the constants file

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgrounds/onbaording.png', // Replace with your actual image path
              fit: BoxFit.cover,
            ),
          ),
          // Text and button overlay
          Positioned(
            top: screenHeight * 0.2, // Use responsive top position
            left: screenWidth * 0.1, // Use responsive left position
            right: screenWidth * 0.1, // Responsive right position
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'EXPEDITO',
                  style: AppFonts.bold.copyWith(
                    fontSize: screenHeight * 0.06, // Responsive font size
                    height: 34.95 / 45,
                    letterSpacing: -0.01,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.1), // Responsive space
                Text(
                  'Journey through the exoplanets',
                  style: AppFonts.regular.copyWith(
                    fontSize: screenHeight * 0.04, // Responsive font size
                    height: 34.95 / 30,
                    letterSpacing: -0.01,
                    color: AppColors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                    height: screenHeight *
                        0.1), // Adjust space between text and button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SignUpScreen()), // Navigate to SignUpScreen
                    );
                  },
                  child: Container(
                    width: screenWidth * 0.8, // Responsive width for the button
                    padding: const EdgeInsets.symmetric(
                        vertical: 20), // Adjust vertical padding
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.circular(25), // Adjusted corner radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10.0,
                          offset: const Offset(0, 5), // Shadow position
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center the text and icon
                      children: [
                        Text(
                          'Sign Up & Play!',
                          style: AppFonts.bold.copyWith(
                            fontSize:
                                screenHeight * 0.025, // Responsive font size
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10), // Space between text and icon
                        Icon(
                          Icons.arrow_forward,
                          color: AppColors.black,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
