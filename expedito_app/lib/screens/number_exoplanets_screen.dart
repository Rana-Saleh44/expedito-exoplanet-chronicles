import 'package:flutter/material.dart';

class NumberExoplanets extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Container(
                  width: 299,
                  height: 89,
                  child: Text(
                    'How many exoplanets did you explore/invade?',
                    style: TextStyle(
                      fontFamily: 'Space Grotesk',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      height: 1.5, // Adjust the height (line height) as needed
                      color:
                          Colors.white, // Change this color based on your needs
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20), // Gap between title and input
                // Input Field
                Container(
                  width: 240,
                  height: 40,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white, width: 1),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter the number of exoplanets',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Space below input
                // Add Player Button
                ElevatedButton(
                  onPressed: () {
                    // Logic to handle adding the player
                    String playerName = _controller.text;
                    print('New player name: $playerName');
                    // Add your logic here
                  },
                  child: Text('Add Player'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}