import 'package:expedito_app/screens/number_exoplanets_screen.dart';
import 'package:flutter/material.dart';

class NavigationUtils {
  static void navigateToStartGame(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => NumberExoplanets(),
      ),
    );
  }
}
