import 'package:flutter/material.dart';

class NewPlayerScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  NewPlayerScreen({super.key});

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
                SizedBox(
                  width: 299,
                  height: 89,
                  child: const Text(
                    'New Player Name',
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
                const SizedBox(height: 20), // Gap between title and input
                // Input Field
                Container(
                  width: 240,
                  height: 40,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white, width: 1),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter player name',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Space below input
                // Add Player Button
                ElevatedButton(
                  onPressed: () {
                    // Logic to handle adding the player
                    String playerName = _controller.text;
                    print('New player name: $playerName');
                    // Add your logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Add Player'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
