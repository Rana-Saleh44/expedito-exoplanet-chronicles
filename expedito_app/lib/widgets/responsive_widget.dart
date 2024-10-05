import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(
      BuildContext context, double screenWidth, double screenHeight) builder;

  const ResponsiveWidget({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return builder(context, screenWidth, screenHeight);
  }
}
