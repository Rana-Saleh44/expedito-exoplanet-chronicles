import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/planet.dart'; // Import the Planet model

class NasaButton extends StatelessWidget {
  final Planet planet;

  const NasaButton({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
  onPressed: () async {
    // Replace with the desired URL
    final url = 'https://science.nasa.gov/exoplanet-catalog/corot-9-b/'; // You might want to add the URL in the Planet model
    
    // Check if the URL can be launched
    if (await canLaunch(url)) {
      await launch(url); // Launch the URL
    } else {
      throw 'Could not launch $url'; // Handle the error
    }
  },

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Blue color for the button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: const Center(
          child: Text(
            "View on NASA",
            style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
