import 'package:flutter/material.dart';

import '../models/planet.dart'; // Import the Planet model

class NasaButton extends StatelessWidget {
  final Planet planet;

  NasaButton({required this.planet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        onPressed: () {
          // Logic to open NASA website or any specific URL
          // You might want to add the URL in the Planet model
        },
        style: ElevatedButton.styleFrom(
          //primary: Colors.blue, // Blue color for the button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
        child: Center(
          child: Text(
            "View on NASA",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
