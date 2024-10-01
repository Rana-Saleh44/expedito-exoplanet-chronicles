import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // No need for a background color, as we are using the image as the background
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgrounds/onboarding.png', // Replace with your actual image path
              fit: BoxFit.cover, // Ensure the image covers the entire screen
            ),
          ),

          // Foreground content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60),

                  // Astronaut Image
                  Image.asset(
                    'assets/images/astronauts/astronaut_logo.png', // Put your astronaut image here
                    height: 150,
                  ),
                  SizedBox(height: 20),

                  // Title "Create an Account"
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Username TextField
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'username',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Email TextField
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'email',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),

                  // Password TextField
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'password',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // "Or" Divider
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Google Sign-In Button
                  ElevatedButton.icon(
                    onPressed: () {
                      // Logic for Google sign-in
                    },
                    icon: Image.asset(
                      'assets/images/icons/devicon_google.png', // Put your Google logo here
                      height: 24,
                    ),
                    label: Text('Continue with Google'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.0),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Sign in text with link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle sign-in navigation
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.purple),
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
