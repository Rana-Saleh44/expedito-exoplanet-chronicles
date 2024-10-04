import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/player_provider.dart';

class LeaderboardScreen extends StatelessWidget {
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
            icon: Image.asset(
              'assets/images/home_screen_icons/Playlist.png',
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
                'assets/images/home_screen_icons/Trophy.png',
                width: 24,
                height: 24,
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
            // Add new player logic
            Provider.of<PlayerProvider>(context, listen: false)
                .addNewPlayer(name);
          },
        ),
      ),
    );
  }
}
