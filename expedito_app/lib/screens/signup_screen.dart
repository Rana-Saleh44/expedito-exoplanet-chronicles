import 'package:flutter/material.dart';

import '../screens/signin_screen.dart'; // Import the SignInScreen

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size; // Correctly get screen size

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
          // Foreground content
          Padding(
            padding: EdgeInsets.all(screenSize.width * 0.05), // 5% padding
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenSize.height * 0.1), // 10% height
                  // Astronaut Image
                  Image.asset(
                    'assets/images/astronauts/astronaut_logo.png',
                    width: screenSize.width * 0.75, // 75% width
                    height: screenSize.height * 0.4, // 40% height
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: screenSize.height * 0.02), // 2% height
                  // Title "Create an Account"
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      color: Colors.blue, // Match the design color
                      fontSize: screenSize.width * 0.07, // 7% of width
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02), // 2% height

                  // Username TextField
                  Container(
                    width: screenSize.width * 0.9, // 90% of width
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'username',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02), // 2% height

                  // Email TextField
                  Container(
                    width: screenSize.width * 0.9, // 90% of width
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'email',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02), // 2% height

                  // Password TextField
                  Container(
                    width: screenSize.width * 0.9, // 90% of width
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'password',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02), // 2% height

                  // "Or" Text
                  Container(
                    width: 64,
                    height: 26,
                    child: Text(
                      'Or',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Space Grotesk',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        height: 1.75, // Line height
                        letterSpacing: -0.01,
                      ),
                      textAlign: TextAlign.center, // Correctly applied here
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02), // 2% height

                  // Continue with Google section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/icons/devicon_google.png', // Google icon image
                        width: 25,
                        height: 25,
                      ),
                      SizedBox(width: 8), // Space between icon and text
                      Container(
                        width: 184,
                        height: 35,
                        child: Text(
                          'Continue with Google',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Space Grotesk',
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            height: 1.75,
                            letterSpacing: -0.01,
                          ),
                          textAlign: TextAlign.center, // Correctly applied here
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.02), // 2% height

                  // Sign Up button
                  Container(
                    width: screenSize.width *
                        0.8, // Responsive width for the button
                    padding: const EdgeInsets.symmetric(
                        vertical: 20), // Adjust vertical padding
                    decoration: BoxDecoration(
                      color: Colors.white, // Use Colors.white directly
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
                          'Sign Up',
                          style: TextStyle(
                            fontSize: screenSize.height *
                                0.025, // Responsive font size
                            color: Colors.black, // Use Colors.black directly
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10), // Space between text and icon
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black, // Use Colors.black directly
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02), // 2% height
                  // Already have an account? Sign in text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Space Grotesk',
                          fontSize:
                              screenSize.width * 0.045, // Responsive font size
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()),
                          );
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'Space Grotesk',
                            fontSize: screenSize.width *
                                0.045, // Responsive font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
