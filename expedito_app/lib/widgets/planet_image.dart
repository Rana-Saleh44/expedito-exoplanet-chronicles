import 'package:flutter/material.dart';

class PlanetImage extends StatelessWidget {
  final String imageUrl;

  PlanetImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl), // Load planet image
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
