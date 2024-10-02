import 'package:flutter/material.dart';

import '../models/planet.dart'; // Planet model
import '../widgets/nasa_button.dart'; // Button widget
import '../widgets/planet_details.dart'; // Detailed info widget
import '../widgets/planet_image.dart'; // Image widget
import '../widgets/planet_info.dart'; // Basic info widget

class ExoplanetScreen extends StatelessWidget {
  final Planet planet; // Pass the Planet object to the screen

  ExoplanetScreen({required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with stars
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgrounds/space_background.png', // Change the path as necessary
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Column(
            children: [
              // Back arrow
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
              SizedBox(height: 16),
              PlanetImage(imageUrl: planet.imageUrl), // Planet Image Widget
              SizedBox(height: 16),
              PlanetInfo(
                name: planet.name,
                description: planet.description,
              ), // Planet Info Widget
              PlanetDetails(planet: planet), // Planet Details Widget
              Spacer(),
              NasaButton(planet: planet), // NASA Button Widget
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
