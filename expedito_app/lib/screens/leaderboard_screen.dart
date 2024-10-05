import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/player_provider.dart';

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgrounds/Leaderboard.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stack for Arrow Icon and Centered Leaderboard Title
              // (Add your leaderboard title and other UI components here)
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF141414),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home_screen_icons/Home.png',
              width: screenWidth * 0.06,
              height: screenHeight * 0.03,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home_screen_icons/planet.png',
              width: screenWidth * 0.06,
              height: screenHeight * 0.03,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home_screen_icons/Playlist.png',
              width: screenWidth * 0.06,
              height: screenHeight * 0.03,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(screenWidth * 0.02),
              decoration: BoxDecoration(
                color: Color(0xFF3ABEF9).withOpacity(0.2),
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
              ),
              child: Image.asset(
                'assets/images/home_screen_icons/Trophy.png',
                width: screenWidth * 0.06,
                height: screenHeight * 0.03,
              ),
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
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
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
            // Add new player logic
            Provider.of<PlayerProvider>(context, listen: false)
                .addNewPlayer(name);
          },
        ),
      ),
    );
  }
}
