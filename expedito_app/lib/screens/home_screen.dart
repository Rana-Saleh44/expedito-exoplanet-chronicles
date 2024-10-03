import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
          Column(
            children: [
              SizedBox(height: 50), // Adjust as needed
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for friends',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Start a New Game',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyanAccent,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(8.0),
                  children: [
                    FriendItem(name: 'add a new player'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle Start button press
                },
                child: Text('Start!'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Corrected style
                  foregroundColor: Colors.black, // Corrected style
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF141414), // Set the background color
        type: BottomNavigationBarType.fixed, // Ensure fixed type
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(8.0), // Add padding to the icon
              decoration: BoxDecoration(
                color: Color(0xFF3ABEF9)
                    .withOpacity(0.2), // Light background color
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: Image.asset(
                'assets/images/home_screen_icons/Home.png',
                width: 24,
                height: 24,
              ),
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
            icon: Image.asset(
              'assets/images/home_screen_icons/Playlist.png',
              width: 24,
              height: 24,
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

class FriendItem extends StatelessWidget {
  final String name;

  const FriendItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.black.withOpacity(0.5),
      ),
      child: ListTile(
        leading: Icon(Icons.person, color: Colors.white),
        title: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          icon: Image.asset('assets/images/icons/add_button.png'),
          onPressed: () {
            // Handle friend adding logic
          },
        ),
      ),
    );
  }
}
