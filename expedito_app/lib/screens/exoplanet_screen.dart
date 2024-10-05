import 'package:flutter/material.dart';
import 'package:expedito_app/services/firestore_service.dart'; // Firestore service
import '../models/planet.dart'; // Planet model
import '../widgets/nasa_button.dart'; // Button widget
import '../widgets/planet_details.dart'; // Detailed info widget
import '../widgets/planet_image.dart'; // Image widget
import '../widgets/planet_info.dart'; // Basic info widget

class ExoplanetScreen extends StatelessWidget {
  const ExoplanetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create an instance of FirestoreService
    FirestoreService firestoreService = FirestoreService();

    // Using FutureBuilder to fetch data asynchronously
    return FutureBuilder<Planet>(
      future: firestoreService.fetchPlanetById("corot-9-b", "CoRoT-9 b"), // Fetch the planet data
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading spinner while fetching data
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Show error message if something went wrong
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          // Planet data is ready
          Planet planet = snapshot.data!;

          // UI layout with planet data
          return Scaffold(
            body: Stack(
              children: [
                // Background image with stars
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/backgrounds/home.png', // Change the path as necessary
                    fit: BoxFit.cover,
                  ),
                ),
                // Main content
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Back arrow
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Wrap the image in a Container to prevent overflow
                      Container(
                        width: double.infinity, // Ensures it takes full width
                        alignment: Alignment.center, // Centers the image horizontally
                        child: Image.asset(
                          'assets/images/planet/CoRoT-9b.png', // Replace with your actual file path
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      PlanetInfo(
                        name: "CoRot-9 b",
                        description: "Gas giant with a relatively temperate atmosphere",
                      ), // Planet Info Widget
                      PlanetDetails(planet: planet), // Planet Details Widget
                      const SizedBox(height: 16), // Add some spacing
                      NasaButton(planet: planet), // NASA Button Widget
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          // If no data, show an empty state
          return const Center(child: Text('No planet data available.'));
        }
      },
    );
  }
}
