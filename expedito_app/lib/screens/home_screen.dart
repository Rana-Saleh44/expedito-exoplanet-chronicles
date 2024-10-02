import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore import
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth import
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // Firebase authentication instance
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; // Firestore instance
  List<Map<String, dynamic>> _friends = []; // Stores the friends list
  List<Map<String, dynamic>> _filteredFriends = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchFriends();
  }

  // Fetch friends from Firestore
  Future<void> _fetchFriends() async {
    User? user = _auth.currentUser; // Get the currently logged-in user
    if (user != null) {
      var snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('friends')
          .get();

      setState(() {
        _friends = snapshot.docs.map((doc) => doc.data()).toList();
        _filteredFriends = _friends;
      });
    }
  }

  // Filter friends based on the search query
  void _filterFriends(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredFriends = _friends.where((friend) {
        return friend['name'].toLowerCase().contains(_searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/space_background.png', // Replace with the actual path to your background image
              fit: BoxFit.cover,
            ),
          ),

          // The rest of the UI on top of the background
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                    height: 50), // Adjust the space from the top if needed
                // Search bar to search for friends
                TextField(
                  onChanged: _filterFriends,
                  decoration: InputDecoration(
                    hintText: "Search for friends",
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    fillColor: Colors.white12,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                // Friends list display
                Expanded(
                  child: _filteredFriends.isEmpty
                      ? Center(
                          child: Text("No friends found",
                              style: TextStyle(color: Colors.white)))
                      : ListView.builder(
                          itemCount: _filteredFriends.length,
                          itemBuilder: (context, index) {
                            final friend = _filteredFriends[index];
                            return ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              leading: Icon(Icons.person, color: Colors.white),
                              title: Text(
                                friend['name'],
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: IconButton(
                                icon: Image.asset(
                                    'assets/images/plus_icon.png'), // Replace with your actual path
                                onPressed: () {
                                  // Add friend or navigate to friend's game or profile
                                },
                              ),
                            );
                          },
                        ),
                ),
                // Add new player option
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  leading: Icon(Icons.person_add, color: Colors.white),
                  title: Text("Add a new player",
                      style: TextStyle(color: Colors.white)),
                  trailing: IconButton(
                    icon: Image.asset(
                        'assets/images/plus_icon.png'), // Replace with your actual path
                    onPressed: () {
                      // Logic to add a new player
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Start button
                ElevatedButton(
                  onPressed: () {
                    // Logic to start the game
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                  ),
                  child: Text(
                    "Start!",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set current index to Home
        onTap: (index) {
          // Handle navigation to different screens
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.public, color: Colors.white), label: 'Friends'),
          BottomNavigationBarItem(
              icon: Icon(Icons.stars, color: Colors.white),
              label: 'Achievements'),
        ],
        backgroundColor: Colors.black,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
