import 'package:flutter/material.dart';

import '../screens/signin_screen.dart'; // Import the SignInScreen

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;

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
                  Text(
                    'Or',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: screenSize.height * 0.02), // 2% height

                  // Google Sign-In Button
                  Container(
                    width: screenSize.width * 0.9, // 90% of width
                    height: screenSize.height * 0.07, // Responsive height
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Logic for Google sign-in
                      },
                      icon: Image.asset(
                        'assets/images/icons/devicon_google.png',
                        height: screenSize.height * 0.025, // Responsive height
                      ),
                      label: Text(
                        'Continue with Google',
                        style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontSize:
                              screenSize.width * 0.045, // Responsive font size
                          fontWeight: FontWeight.normal,
                          color: Colors.black, // Text color for Google button
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white, // Set button background color
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0), // Adjusted padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // Rounded corners
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.04), // 4% height

                  // Updated Sign Up Button
                  Container(
                    width: screenSize.width * 0.4, // 40% of width
                    height: screenSize.height * 0.1, // 10% of height
                    child: ElevatedButton(
                      onPressed: () {
                        // Logic for sign-up
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontSize:
                              screenSize.width * 0.06, // Responsive font size
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Text color for Sign Up button
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white, // Set button background color
                        padding: EdgeInsets.symmetric(
                            vertical: 17,
                            horizontal: 81), // Padding as per design
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20), // 20px for top-left
                            topRight: Radius.circular(0), // 0px for top-right
                            bottomLeft:
                                Radius.circular(0), // 0px for bottom-left
                            bottomRight:
                                Radius.circular(0), // 0px for bottom-right
                          ),
                        ),
                        elevation: 0, // Remove elevation if needed
                      ),
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
