import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color blue = Color(0xFF3ABEF9);
}

class AppFonts {
  static const String spaceGrotesk = 'SpaceGrotesk';

  static const TextStyle regular = TextStyle(
    fontFamily: spaceGrotesk,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bold = TextStyle(
    fontFamily: spaceGrotesk,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle medium = TextStyle(
    fontFamily: spaceGrotesk,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle light = TextStyle(
    fontFamily: spaceGrotesk,
    fontWeight: FontWeight.w300,
  );
}
