import 'package:flutter/material.dart';

class CollectionsScreen extends StatelessWidget {
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
              SizedBox(height: 50), // Adjust as needed for spacing
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      // Handle back button press
                    },
                  ),
                  Text(
                    'My Collections',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: Text('Planetary Groups'),
                    selected: true, // Assuming this tab is active
                    onSelected: (bool selected) {},
                  ),
                  SizedBox(width: 10),
                  ChoiceChip(
                    label: Text('Badges'),
                    selected: false, // Inactive tab
                    onSelected: (bool selected) {},
                  ),
                  SizedBox(width: 10),
                  ChoiceChip(
                    label: Text('Exo-Planets'),
                    selected: false, // Inactive tab
                    onSelected: (bool selected) {},
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    CollectionItem(
                      title: 'Gas Giants',
                      progress: '75%',
                      medals: ['gold', 'silver', 'bronze'],
                    ),
                    CollectionItem(
                      title: 'Eccentric Orbits',
                      progress: '100%',
                      medals: ['gold', 'silver', 'bronze'],
                    ),
                    CollectionItem(
                      title: 'Super-Earths',
                      progress: '24%',
                      medals: ['gold'],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: '',
          ),
        ],
      ),
    );
  }
}

class CollectionItem extends StatelessWidget {
  final String title;
  final String progress;
  final List<String> medals;

  CollectionItem({
    required this.title,
    required this.progress,
    required this.medals,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
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
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
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
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
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
