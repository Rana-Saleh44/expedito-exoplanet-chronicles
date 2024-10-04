import 'package:expedito_app/providers/player_provider.dart';
import 'package:expedito_app/screens/add_new_player_screen.dart';
import 'package:expedito_app/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the provider package

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlayerProvider()),
        // Add other providers if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // To remove the debug banner
        title: 'Expedito',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: OnBoarding(), // Set OnBoarding as the initial route
        routes: {
          // Define the routes for the application
          '/newPlayer': (context) =>
              NewPlayerScreen(), // Add route for NewPlayerScreen
        },
      ),
    );
  }
}
