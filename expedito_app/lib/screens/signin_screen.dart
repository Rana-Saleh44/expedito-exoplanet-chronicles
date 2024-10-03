import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
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
                    'Welcome Back!',
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
                    width: 165,
                    height: 82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      color: Colors.white,
                    ),
                    child: TextButton(
                      onPressed: () {
                        // On click logic goes here
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Space Grotesk',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.5, // Line height as factor of font size
                        ),
                      ),
                    ),
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
