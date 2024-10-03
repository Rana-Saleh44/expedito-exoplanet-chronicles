// lib/utils/responsive.dart
import 'package:flutter/material.dart';

class Responsive {
  static double getHeight(BuildContext context, double height) {
    return MediaQuery.of(context).size.height *
        height /
        812; // Adjust based on design size
  }

  static double getWidth(BuildContext context, double width) {
    return MediaQuery.of(context).size.width *
        width /
        375; // Adjust based on design size
  }
}
