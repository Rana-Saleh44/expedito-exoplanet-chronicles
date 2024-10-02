import 'package:expedito_app/screens/qr_screen.dart';
import 'package:flutter/material.dart';
import 'screens/onboarding.dart'; // Import the HomeScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // To remove the debug banner
      title: 'Expedito',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: onBoarding(), // Set HomeScreen as the initial route
    );
  }
}
