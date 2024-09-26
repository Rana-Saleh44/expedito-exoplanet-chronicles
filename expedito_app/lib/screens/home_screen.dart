import 'package:flutter/material.dart';

import '../screens/signup_screen.dart'; // Import the SignUpScreen
// import '../widgets/planet_widget.dart'; // Assuming you created this
// import '../widgets/highlight_widget.dart';
// import '../widgets/star_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background to black
      body: Stack(
        children: [
          // Add planets, stars, and highlights as individual widgets
          // Positioned(
          //   top: 150,
          //   left: 100,
          //   child: PlanetWidget(imagePath: 'assets/planets/earth.png'),
          // ),
          // Positioned(
          //   top: 100,
          //   right: 80,
          //   child: PlanetWidget(imagePath: 'assets/planets/mars.png'),
          // ),
          // Positioned(
          //   bottom: 200,
          //   left: 50,
          //   child: HighlightWidget(),  // Custom widget for highlights
          // ),
          // // Add more elements like stars, other planets, etc.
          // Positioned(
          //   top: 50,
          //   right: 200,
          //   child: StarWidget(),
          // ),
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text('Sign Up and Play!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
