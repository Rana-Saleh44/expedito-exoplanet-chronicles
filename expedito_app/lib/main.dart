import 'package:expedito_app/screens/qr_screen.dart';
import 'package:flutter/material.dart';

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
      home: QrScreen(), // Set OnBoarding as the initial route
    );
  }
}
