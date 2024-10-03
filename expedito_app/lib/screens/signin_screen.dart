import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_screen.dart'; // Import your HomeScreen

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  Future<void> _signIn() async {
    try {
      // Sign in with email and password
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // After sign-in, you can access Firestore if needed
      final user = userCredential.user;
      if (user != null) {
        // Optional: Retrieve user data from Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        // Handle user data as needed

        // Navigate to home screen after successful sign-in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()), // Directly navigate to HomeScreen
        );
      }
    } catch (e) {
      print("Sign in error: $e"); // Print the error for debugging
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

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
            padding: EdgeInsets.all(screenSize.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenSize.height * 0.05),
                // Astronaut Image
                Image.asset(
                  'assets/images/astronauts/astronaut_logo.png',
                  width: screenSize.width * 0.6,
                  height: screenSize.height * 0.3,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: screenSize.height * 0.02),
                // Title "Welcome Back!"
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: screenSize.width * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.015),

                // Email TextField
                Container(
                  width: screenSize.width * 0.9,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
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

                SizedBox(height: screenSize.height * 0.015),

                // Password TextField
                Container(
                  width: screenSize.width * 0.9,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenSize.height * 0.015),

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
                      height: 1.75,
                      letterSpacing: -0.01,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.015),

                // Continue with Google section
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/icons/devicon_google.png',
                          width: 25,
                          height: 25,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Space Grotesk',
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            height: 1.75,
                            letterSpacing: -0.01,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),

                // Sign In button
                GestureDetector(
                  onTap: _signIn,
                  child: Container(
                    width: screenSize.width * 0.8,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10.0,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: screenSize.height * 0.025,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
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
