import 'package:firebase_storage/firebase_storage.dart';

class Planet {
  final String name;
  final String description;
  final String type;
  final String distance;
  final String star;
  final String orbit;
  final String size;
  final String temperature;
  final String habitability;
  final String details;
  String? imageUrl;
  final String classification;
  final String constellation;
  final String status;
  final String uniqueFeature;
  final String weather;
  final String discoveryMethod;
  final String meaning;
  final String composition;

  Planet({
    required this.name,
    required this.description,
    required this.type,
    required this.distance,
    required this.star,
    required this.orbit,
    required this.size,
    required this.temperature,
    required this.habitability,
    required this.details,
    this.imageUrl,
    required this.classification,
    required this.constellation,
    required this.status,
    required this.uniqueFeature,
    required this.weather,
    required this.discoveryMethod,
    required this.meaning,
    required this.composition,
  });

  factory Planet.fromFirestore(Map<String, dynamic> data) {
    return Planet(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      type: data['type'] ?? '',
      distance: data['distance'] ?? '',
      star: data['star'] ?? '',
      orbit: data['orbit'] ?? '',
      size: data['size'] ?? '',
      temperature: data['temperature'] ?? '',
      habitability: data['habitability'] ?? '',
      details: data['details'] ?? '',
      classification: data['classification'] ?? '',
      constellation: data['constellation'] ?? '',
      status: data['status'] ?? '',
      uniqueFeature: data['uniqueFeature'] ?? '',
      weather: data['weather'] ?? '',
      discoveryMethod: data['discoveryMethod'] ?? '',
      meaning: data['meaning'] ?? '',
      composition: data['composition'] ?? '',
    );
  }

  Future<void> fetchImageUrl() async {
    try {
      final ref = FirebaseStorage.instance.ref('planets/${this.name}.jpg');
      this.imageUrl = await ref.getDownloadURL();
    } catch (e) {
      print('Error fetching image URL: $e');
      this.imageUrl = null; // or a URL to a default image
    }
  }
}