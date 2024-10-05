import 'package:expedito_app/screens/planetary_groups_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      // Navigate to CollectionsScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CollectionsScreen()),
      );
    }
  }

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
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the start (left)
            children: [
<<<<<<< HEAD
              const SizedBox(height: 50), // Adjust as needed
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for friends',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
=======
              SizedBox(height: 50), // Adjust as needed
              Row(
                children: [
                  SizedBox(width: 21), // Align with the left edge
                  Container(
                    width: 313, // Fixed width
                    height: 50, // Fixed height
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                      color: Color(0xFF161616)
                          .withOpacity(0.8), // Adjusted background color
>>>>>>> 273509d30a3e4c6055717fe52be0342c9314eee7
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search for friends',
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none, // Remove border
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 10), // Gap between text field and avatar
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/icons/Avatar.png',
                      width: 30, // Adjust as needed
                      height: 30, // Adjust as needed
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10), // Space between search and title
              Padding(
                padding:
                    const EdgeInsets.only(left: 21.0), // Align text to the left
                child: Text(
                  'Start a New Game',
                  style: TextStyle(
                    fontFamily: 'Space Grotesk', // Set font family
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3ABEF9), // Adjusted color
                  ),
                ),
              ),
<<<<<<< HEAD
              const SizedBox(height: 20),
              const Text(
                'Start a New Game',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyanAccent,
=======
              SizedBox(height: 10), // Space between title and friends text
              Padding(
                padding:
                    const EdgeInsets.only(left: 21.0), // Align text to the left
                child: Text(
                  'Choose your friends',
                  style: TextStyle(
                    fontFamily: 'Space Grotesk', // Set font family
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
>>>>>>> 273509d30a3e4c6055717fe52be0342c9314eee7
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8.0),
                  children: const [
                    FriendItem(name: 'salmahamed'),
                    FriendItem(name: 'mennaosama'),
                    FriendItem(name: 'jananayef'),
                    FriendItem(name: 'nadinelshafey'),
                    FriendItem(name: 'ranasaleh'),
                    FriendItem(name: 'add a new player'),
                  ],
                ),
              ),
<<<<<<< HEAD
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle Start button press
                  Navigator.pushNamed(context, '/numExoplanets');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
=======
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Start button press
                  },
                  child: Text('Start!'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
>>>>>>> 273509d30a3e4c6055717fe52be0342c9314eee7
                  ),
                ),
                child: Text('Start!'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF141414),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, // Set the current index
        onTap: _onItemTapped, // Handle tap events
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xFF3ABEF9).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
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

  const FriendItem({super.key, required this.name});

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
        leading: const Icon(Icons.person, color: Colors.white),
        title: Text(
          name,
          style: const TextStyle(color: Colors.white),
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
