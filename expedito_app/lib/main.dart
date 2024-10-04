import 'package:expedito_app/providers/player_provider.dart';
import 'package:expedito_app/screens/add_new_player_screen.dart';
import 'package:expedito_app/screens/exoplanet_screen.dart';
import 'package:expedito_app/screens/quizzes_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:expedito_app/screens/qr_screen.dart';
import 'package:expedito_app/screens/onboarding_screen.dart';
import 'package:expedito_app/screens/signin_screen.dart';
import 'package:expedito_app/screens/signup_screen.dart';
import 'package:expedito_app/screens/number_exoplanets_screen.dart';
import 'package:expedito_app/screens/search_friends_screen.dart';

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
        initialRoute: 'exoplanetScreen',//'/onBoarding',
        routes: {
          // Define the routes for the application
          '/onBoarding': (context) => OnBoarding(), 
          '/signUp': (context) => SignUpScreen(), 
          '/signIn': (context) => SignInScreen(),
          '/home': (context) => HomeScreen(),
          '/numExoplanets': (context) => NumberExoplanets(),  
          '/qrScanner': (context) => QrScreen(),
          '/exoplanetScreen': (context) => ExoplanetScreen(),

          // '/searchFriends': (context) => SearchFriendsScreen(), 
          '/newPlayer': (context) => NewPlayerScreen(), 
        },
      ),
    );
  }
}
