import 'package:flutter/material.dart';

import '../models/planet.dart'; // Import the Planet model

class PlanetDetails extends StatelessWidget {
  final Planet planet;

  PlanetDetails({required this.planet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailItem(label: "Type", value: planet.type),
            DetailItem(label: "Distance", value: planet.distance),
            DetailItem(label: "Star", value: planet.star),
            DetailItem(label: "Orbital Period", value: planet.orbitalPeriod),
            DetailItem(label: "Size", value: planet.size),
            DetailItem(label: "Temperature", value: planet.temperature),
            DetailItem(label: "Habitability", value: planet.habitability),
            SizedBox(height: 8),
            Text(
              "Interesting Fact: ${planet.interestingFact}",
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

// A helper widget to display label-value pairs
class DetailItem extends StatelessWidget {
  final String label;
  final String value;

  DetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
