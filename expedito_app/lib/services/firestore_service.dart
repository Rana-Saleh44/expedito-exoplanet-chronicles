import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expedito_app/models/planet.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to fetch planet data from Firestore and its image from Cloud Storage
  Future<Planet> fetchPlanetById(String planetId, String planetName) async {
    try {
      // Fetch the planet document from Firestore
      final docSnapshot = await _db.collection('Planets').doc(planetId).get();

      if (!docSnapshot.exists) {
        throw Exception('Planet not found');
      }

      // Extract the document data
      final planetData = docSnapshot.data()!;

      // Fetch the image from Cloud Storage
      final imageUrl = await _fetchPlanetImageUrl(planetName);

      // Map the data to a Planet object
      final planet = Planet(
        id: planetData['id'],
        name: planetData['name'],
        // description: planetData['description'],
        // type: planetData['type'],
        // distance: planetData['distance'],
        // star: planetData['star'],
        // size: planetData['size'],
        // temperature: planetData['temperature'],
        // habitability: planetData['habitability'],
        imageUrl: imageUrl, // Add the image URL here
      );

      return planet;

    } catch (e) {
      throw Exception('Error fetching planet: $e');
    }
  }

  // Private function to fetch image URL from Cloud Storage
  Future<String> _fetchPlanetImageUrl(String planetName) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('$planetName.png');
      final imageUrl = await storageRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      throw Exception('Error fetching planet image: $e');
    }
  }
}
