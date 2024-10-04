import 'package:flutter/material.dart';

class QuizzesScreen extends StatefulWidget {
  @override
  _QuizzesScreenState createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen> {
  int _selectedIndex = 2; // Start with the third icon selected

  // Navigation method to handle navigation based on selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CollectionsScreen()),
        );
        break;
      case 2:
        // Current screen (QuizzesScreen)
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LeaderboardScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgrounds/Planet.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF141414),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, // Set the current index
        onTap: _onItemTapped, // Handle tap events
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home_screen_icons/Home.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home_screen_icons/planet.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFF3ABEF9).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                'assets/images/home_screen_icons/Playlist.png',
                width: 24,
                height: 24,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home_screen_icons/Trophy.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

// Sample screens for navigation
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Home Screen")));
  }
}

class CollectionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Collections Screen")));
  }
}

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Leaderboard Screen")));
  }
}
