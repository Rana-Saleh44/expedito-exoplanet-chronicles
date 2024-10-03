import 'package:expedito_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore import
import '../screens/home_screen.dart'; // Import HomeScreen here
import '../screens/signin_screen.dart'; // Import SignInScreen here
import '../services/auth_service.dart'; // Assuming this handles Firebase Authentication
import 'package:flutter/gestures.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false; // Toggle for password visibility

  // Add Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _signUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Sign up the user using Firebase Auth
        await AuthService().signUpWithEmailAndPassword(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );

        // Store user data in Firestore
        await _firestore.collection('users').add({
          'username': _usernameController.text.trim(),
          'email': _emailController.text.trim(),
          'password': _hashPassword(_passwordController.text.trim()), // Ensure to hash the password for security
        });

        // Navigate to HomeScreen after successful sign-up
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } catch (e) {
        // Handle errors (e.g., show a snackbar)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // Dummy password hash function (replace this with a real hashing function)
  String _hashPassword(String password) {
    // Implement your own hashing mechanism here, such as using bcrypt
    return password; // For now, we return the raw password (DON'T do this in production)
  }

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: EdgeInsets.all(screenSize.width * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenSize.height * 0.05),
                  Image.asset(
                    'assets/images/astronauts/astronaut_logo.png',
                    width: screenSize.width * 0.6,
                    height: screenSize.height * 0.3,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  Text(
                    'Create an Account',
                    style: AppFonts.bold.copyWith(
                      fontSize: screenSize.height * 0.035, // Increase the font size
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.015),

                  // Username TextField
                  Container(
                    width: screenSize.width * 0.9,
                    child: TextFormField(
                      controller: _usernameController,
                      style: AppFonts.regular.copyWith(
                        fontSize: screenSize.height * 0.025,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: AppFonts.regular.copyWith(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.015),

                  // Email TextField
                  Container(
                    width: screenSize.width * 0.9,
                    child: TextFormField(
                      controller: _emailController,
                      style: AppFonts.regular.copyWith(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: AppFonts.regular.copyWith(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || !value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.015),

                  // Password TextField
                  Container(
                    width: screenSize.width * 0.9,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible, // Use the toggle here
                      style: AppFonts.regular.copyWith(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: AppFonts.regular.copyWith(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible =
                                  !_isPasswordVisible; // Toggle visibility
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.015),

                  // Sign Up button
                  _isLoading
                      ? CircularProgressIndicator()
                      : GestureDetector(
                          onTap: _signUp,
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
                              'Sign Up',
                              style: AppFonts.bold.copyWith(
                                fontSize: screenSize.height * 0.025,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                  SizedBox(height: screenSize.height * 0.02),

                  // Already have an account text
                  RichText(
                    text: TextSpan(
                      style: AppFonts.regular.copyWith(
                        fontSize: screenSize.height * 0.025,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Sign In',
                          style: AppFonts.bold.copyWith(
                            color: Colors.blue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to SignInScreen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ),
                              );
                            },
                        ),
                      ],
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
