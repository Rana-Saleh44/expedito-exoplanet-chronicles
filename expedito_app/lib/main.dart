import 'package:expedito_app/models/planet.dart';
import 'package:expedito_app/models/player.dart';
import 'package:expedito_app/providers/player_provider.dart';
import 'package:expedito_app/screens/add_new_player_screen.dart';
import 'package:expedito_app/screens/badges_screen.dart';
import 'package:expedito_app/screens/exoplanet_screen.dart';
import 'package:expedito_app/screens/leaderboard_screen.dart';
import 'package:expedito_app/screens/quizzes_screen.dart';
import 'package:expedito_app/screens/signin_screen.dart';
import 'package:expedito_app/screens/signup_screen.dart';
import 'package:expedito_app/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:expedito_app/screens/qr_screen.dart';
import 'package:expedito_app/screens/onboarding_screen.dart';
import 'package:expedito_app/screens/number_exoplanets_screen.dart';


import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {

    //hardcoded
    List<Player> players = [
      Player(name: 'rana', score: 50),
      Player(name: 'nadeen', score: 30),
      Player(name: 'jana', score: 25),
      Player(name: 'menna', score: 22),
      Player(name: 'salma', score:19)];



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
        initialRoute: '/onBoarding',
        routes: {
          // Define the routes for the application
          '/onBoarding': (context) => OnBoarding(), 
          '/signUp': (context) => SignUpScreen(), 
          '/signIn': (context) => SignInScreen(),
          '/home': (context) => HomeScreen(),
          '/numExoplanets': (context) => NumberExoplanets(),  
          '/qrScanner': (context) => QrScreen(), // TODO nav using scanned qr code 
          '/exoplanetScreen': (context) => ExoplanetScreen(),
          '/leaderboard': (context) => AnimatedLeaderboard(players: players),
          '/badges': (context) => BadgesScreen(),
          // '/searchFriends': (context) => SearchFriendsScreen(), 
          '/newPlayer': (context) => NewPlayerScreen(), 

          // '/signIn': (context) => SignInScreen(), // Add route for SignInScreen
          // '/signUp': (context) => SignUpScreen(), // Add route for SignOutScreen

        },
      ),
    );
  }
}
