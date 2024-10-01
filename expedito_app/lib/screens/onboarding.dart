import 'package:flutter/material.dart';

import '../screens/signup_screen.dart'; // Import the SignUpScreen

class onBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // No need for a background color, as we are using the image as the background
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgrounds/onbaording.png', // Replace with your actual image path
              fit: BoxFit.cover, // Ensure the image covers the entire screen
            ),
          ),
          // Text and button overlay
          Positioned(
            top: 50,
            left: 50,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'EXPEDITO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Journey through the exoplanets',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton.icon(
                  // Using ElevatedButton.icon for text and icon
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  icon: Icon(Icons.arrow_forward), // Arrow icon
                  label: Text('Sign Up & Play!'), // Updated button text
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
