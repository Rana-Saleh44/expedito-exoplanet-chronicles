import 'package:flutter/material.dart';

import 'screens/home_screen.dart'; // Import the HomeScreen

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
      home: HomeScreen(), // Set HomeScreen as the initial route
    );
  }
}
