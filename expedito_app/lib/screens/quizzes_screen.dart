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
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgrounds/home.png',
              fit: BoxFit.cover,
            ),
          ),
          // Scrollable Column with specified children
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 63.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Child - Arrow and Centered Quizzes text
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/quizzes/arrow.png',
                        width: screenWidth * 0.1, // Adjust size for responsiveness
                        height: screenWidth * 0.1,
                      ),
                      Expanded(
                        child: Center(
                          child: const Text(
                            'Quizzes',
                            style: TextStyle(
                              fontFamily: 'Space Grotesk',
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  // Second Child - Test your knowledge text
                  const Text(
                    'Test your knowledge and increase your score!',
                    style: TextStyle(
                      fontFamily: 'Space Grotesk',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      height: 1.46,
                      letterSpacing: -0.01,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Third Child - Set of images under each other
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/quizzes/gas_giants.png',
                        width: screenWidth * 0.8,
                      ),
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/images/quizzes/super_earths.png',
                        width: screenWidth * 0.8,
                      ),
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/images/quizzes/eccentric_orbits.png',
                        width: screenWidth * 0.8,
                      ),
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/images/quizzes/habitable_zones.png',
                        width: screenWidth * 0.8,
                      ),
                    ],
                  ),
                ],
              ),
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
