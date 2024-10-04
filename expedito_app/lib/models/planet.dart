import 'package:firebase_storage/firebase_storage.dart';

class Planet {
  String? id;
  String? name;
  String? description;
  String? type;
  String? distance;
  String? star;
  String? orbit;
  String? size;
  String? temperature;
  String? habitability;
  String? details;
  String? imageUrl;
  String? classification;
  String? constellation;
  String? status;
  String? uniqueFeature;
  String? weather;
  String? discoveryMethod;
  String? meaning;
  String? composition;

  Planet({
    required this.id,
    required this.name,
     this.description,
     this.type,
     this.distance,
     this.star,
     this.orbit,
     this.size,
     this.temperature,
     this.habitability,
     this.details,
     required this.imageUrl,
     this.classification,
     this.constellation,
     this.status,
     this.uniqueFeature,
     this.weather,
     this.discoveryMethod,
     this.meaning,
     this.composition,
  });

  // factory Planet.fromFirestore(Map<String, dynamic> data) {
  //   return Planet(
  //     name: data['name'] ?? '',
  //     description: data['description'] ?? '',
  //     type: data['type'] ?? '',
  //     distance: data['distance'] ?? '',
  //     star: data['star'] ?? '',
  //     orbit: data['orbit'] ?? '',
  //     size: data['size'] ?? '',
  //     temperature: data['temperature'] ?? '',
  //     habitability: data['habitability'] ?? '',
  //     details: data['details'] ?? '',
  //     classification: data['classification'] ?? '',
  //     constellation: data['constellation'] ?? '',
  //     status: data['status'] ?? '',
  //     uniqueFeature: data['uniqueFeature'] ?? '',
  //     weather: data['weather'] ?? '',
  //     discoveryMethod: data['discoveryMethod'] ?? '',
  //     meaning: data['meaning'] ?? '',
  //     composition: data['composition'] ?? '',
  //   );
  // }

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