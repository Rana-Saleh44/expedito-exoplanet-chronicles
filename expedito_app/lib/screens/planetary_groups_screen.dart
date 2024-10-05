import 'package:flutter/material.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            // Background
            Positioned.fill(
              child: Image.asset(
                'assets/images/backgrounds/Planet.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 50), // Adjust as needed for spacing
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        // Handle back button press
                      },
                    ),
                    const Text(
                      'My Collections',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceChip(
                      label: const Text('Planetary Groups'),
                      selected: true, // Assuming this tab is active
                      onSelected: (bool selected) {},
                    ),
                    const SizedBox(width: 10),
                    ChoiceChip(
                      label: const Text('Badges'),
                      selected: false, // Inactive tab
                      onSelected: (bool selected) {},
                    ),
                    const SizedBox(width: 10),
                    ChoiceChip(
                      label: const Text('Exo-Planets'),
                      selected: false, // Inactive tab
                      onSelected: (bool selected) {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      CollectionItem(
                        title: 'Gas Giants',
                        progress: '75%',
                        medals: const ['gold', 'silver', 'bronze'],
                      ),
                      CollectionItem(
                        title: 'Eccentric Orbits',
                        progress: '100%',
                        medals: const ['gold', 'silver', 'bronze'],
                      ),
                      CollectionItem(
                        title: 'Super-Earths',
                        progress: '24%',
                        medals: const ['gold'],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF141414), // Set the background color
          type: BottomNavigationBarType.fixed, // Ensure fixed type
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
              icon: Container(
                padding: const EdgeInsets.all(8.0), // Add padding to the icon
                decoration: BoxDecoration(
                  color: const Color(0xFF3ABEF9)
                      .withOpacity(0.2), // Light background color
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: Image.asset(
                  'assets/images/home_screen_icons/planet.png',
                  width: 24,
                  height: 24,
                ),
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
        ));
  }
}

class CollectionItem extends StatelessWidget {
  final String title;
  final String progress;
  final List<String> medals;

  const CollectionItem({super.key, 
    required this.title,
    required this.progress,
    required this.medals,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: medals.map((medal) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      'assets/images/icons/$medal.png',
                      width: 24,
                      height: 24,
                    ),
                  );
                }).toList(),
              ),
              CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Text(
                  progress,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  // Handle forward button press
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
