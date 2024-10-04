import 'package:flutter/material.dart';

import '../models/player.dart';

class PlayerProvider with ChangeNotifier {
  List<Player> _players = [];
  List<Player> get players => _players;

  void addPlayer(Player player) {
    _players.add(player);
    notifyListeners();
  }

  void addNewPlayer(String name) {
    final newPlayer = Player(id: DateTime.now().toString(), name: name);
    _players.add(newPlayer);
    notifyListeners();
  }
}
