import 'package:flutter/material.dart';

import '../utils/constants.dart'; // Import the constants file

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            top: 89,
            left: 57,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'EXPEDITO',
                  style: AppFonts.bold.copyWith(
                    fontSize: 45,
                    height: 34.95 /
                        45, // line-height in Flutter is given as height = lineHeight / fontSize
                    letterSpacing: -0.01,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 69), // Adjust space between texts
                Text(
                  'Journey through the exoplanets',
                  style: AppFonts.regular.copyWith(
                    fontSize: 30,
                    height: 34.95 / 30,
                    letterSpacing: -0.01,
                    color: AppColors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 102), // Adjust space between text and button
                Container(
                  width: 245,
                  height: 82,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 81, vertical: 17),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sign Up & Play!',
                        style: AppFonts.bold.copyWith(
                          fontSize: 21,
                          height: 28.64 / 21,
                          color: AppColors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.black,
                        size: 28,
                      ),
                    ],
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
