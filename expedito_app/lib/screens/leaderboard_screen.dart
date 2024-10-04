import 'package:expedito_app/screens/home_screen.dart';
import 'package:expedito_app/screens/planetary_groups_screen.dart';
import 'package:expedito_app/screens/leaderboard_screen.dart'; // Ensure this matches your file structure
import 'package:flutter/material.dart';

class QuizzesScreen extends StatefulWidget {
  @override
  _QuizzesScreenState createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen> {
  int _selectedIndex = 2; // Start with the third icon selected (current screen)

  // Navigation method to handle navigation based on selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to respective screens based on selected icon
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
      
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgrounds/home.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 63.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/quizzes/arrow.png',
                        width: screenWidth * 0.1,
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
