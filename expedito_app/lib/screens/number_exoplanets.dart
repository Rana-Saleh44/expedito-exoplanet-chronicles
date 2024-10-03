import 'package:flutter/material.dart';

class NumberExoplanets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgrounds/Planet.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
