import 'package:flutter/material.dart';

class NumberExoplanets extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  NumberExoplanets({super.key});

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
                const Text(
                    'How many exoplanets did you explore/invade?',
                    style: TextStyle(
                      fontFamily: 'Space Grotesk',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      // height: 1.5, // Adjust the height (line height) as needed
                      color:
                          Colors.white, // Change this color based on your needs
                    ),
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 20), // Gap between title and input
                // Input Field
    Row(
  mainAxisSize: MainAxisSize.min, // Prevents Row from taking full width
  children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: 300, // Set a fixed width for the TextField
        height: 48, // Keep the height for the TextField
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            hintText: 'Enter the number of exoplanets',
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.lightBlue, width: 1.5),
            ),
          ),
        ),
      ),
    ),
    IconButton(
      icon: const Icon(
        Icons.arrow_forward_rounded, // Right arrow icon
        size: 30,            // Adjust the size as needed
        color: Colors.blue,  // Change the color as needed
      ),
      onPressed: () {
        Navigator.pushNamed(context, "/qrScanner");
      },
    ),
  ],
),

 const SizedBox(height: 20), // Space below input
              //   // Add Player Button
              //   ElevatedButton(
              //     onPressed: () {
              //       // Logic to handle adding the player
              //       String playerName = _controller.text;
              //       print('New player name: $playerName');
              //       // Add your logic here
              //     },
              //     child: Text('Add Player'),
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.blue, // Button color
              //       padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //     ),
              //   ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
