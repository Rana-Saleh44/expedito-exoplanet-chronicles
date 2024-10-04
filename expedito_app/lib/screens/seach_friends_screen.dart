import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/player.dart'; // Make sure to import your Player model
import '../providers/player_provider.dart'; // Import PlayerProvider

class SearchFriendsScreen extends StatefulWidget {
  final String query;

  const SearchFriendsScreen({required this.query, Key? key}) : super(key: key);

  @override
  _SearchFriendsScreenState createState() => _SearchFriendsScreenState();
}

class _SearchFriendsScreenState extends State<SearchFriendsScreen> {
  late TextEditingController _searchController;
  List<Player> _filteredPlayers = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.query);
    _filterPlayers(); // Filter players initially
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterPlayers() {
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    final allPlayers = playerProvider.players;

    setState(() {
      _filteredPlayers = allPlayers
          .where((player) => player.name
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final playerProvider = Provider.of<PlayerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Friends'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                _filterPlayers(); // Call filter function on text change
              },
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
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredPlayers.length,
                itemBuilder: (context, index) {
                  final player = _filteredPlayers[index];
                  return FriendItem(name: player.name);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FriendItem extends StatelessWidget {
  final String name;

  const FriendItem({required this.name, Key? key}) : super(key: key);

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
          icon: Icon(Icons.add,
              color: Colors
                  .white), // You can replace with an asset if you have one
          onPressed: () {
            // Add new player logic
            Provider.of<PlayerProvider>(context, listen: false)
                .addNewPlayer(name);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('$name added!')));
          },
        ),
      ),
    );
  }
}
