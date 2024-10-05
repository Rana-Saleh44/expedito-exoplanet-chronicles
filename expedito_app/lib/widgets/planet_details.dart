import 'package:flutter/material.dart';

import '../models/planet.dart'; // Import the Planet model

class PlanetDetails extends StatelessWidget {
  final Planet planet;

  const PlanetDetails({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView( // Keep only one SingleChildScrollView
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Column( // Directly use Column here
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailItem(label: "Classification", value: "Hot Jupiter"),
              DetailItem(label: "Constellation", value: "Monoceros"),
              DetailItem(label: "Distance", value: "500 light-years"),
              DetailItem(label: "Name", value: "CoRoT-9 b"),
              DetailItem(label: "Status", value: "Confirmed"),
              DetailItem(label: "Temperature", value: "Estimated equilibrium temperature of around 1,000 K (727°C or 1,340°F)"),
              DetailItem(label: "Unique Feature", value: "Cooler-than-usual temperature compared to other hot Jupiters, despite its close orbit"),
              DetailItem(label: "Weather", value: "Strong winds and extreme weather conditions"),
              const SizedBox(height: 8),
              // Text(
              //   "Details: ${planet.details}",
              //   style: TextStyle(color: Colors.white70),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// A helper widget to display label-value pairs
class DetailItem extends StatelessWidget {
  final String label;
  final String value;

  const DetailItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded( // Wrap label in Expanded to take available space
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible( // Use Flexible to allow value text to wrap
            child: Text(
              value,
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.visible, // Ensure it handles overflow correctly
            ),
          ),
        ],
      ),
    );
  }
}
