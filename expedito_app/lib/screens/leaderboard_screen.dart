import 'package:expedito_app/models/player.dart';
import 'package:flutter/material.dart';

// class AnimatedLeaderboard extends StatefulWidget {
//   final List<Player> players;

//   const AnimatedLeaderboard({Key? key, required this.players}) : super(key: key);

//   @override
//   _AnimatedLeaderboardState createState() => _AnimatedLeaderboardState();
// }

// class _AnimatedLeaderboardState extends State<AnimatedLeaderboard> {
//   @override
//   Widget build(BuildContext context) {
//     // Sort players by score in descending order
//     List<Player> sortedPlayers = widget.players
//       ..sort((a, b) => b.score.compareTo(a.score));

//     return Scaffold(
//         body: Stack(
//           children: [
//             // Background
//             Positioned.fill(
//               child: Image.asset(
//                 'assets/images/backgrounds/Planet.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Column(
//               children: [
//                 SizedBox(height: 50), // Adjust as needed for spacing
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.arrow_back_ios),
//                       color: Colors.white,
//                       onPressed: () {
//                         // Handle back button press
//                       },
//                     ),
//                     Text(
//                       'Leaderboard',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),

//             Column(
//       children: [
//         for (int i = 0; i < 3; i++) _buildAnimatedBar(sortedPlayers[i], i + 1),
//       ],),
//     ],),
//     ]));
//   }

//   Widget _buildAnimatedBar(Player player, int rank) {
 
//     return TweenAnimationBuilder<double>(
//       tween: Tween(begin: 0.0, end: player.score.toDouble()),
//       duration: Duration(seconds: 2),
//       builder: (context, value, child) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               // Display rank and player name
//               Text('$rank. ${player.name}', style:TextStyle(color:Colors.white)),
//               SizedBox(width: 10),
//               // Animated bar representing the player's score
//               Expanded(
//                 child: Stack(
//                   children: [
//                     Container(
//                       height: 20,
//                       color: Colors.transparent,
                      
//                     ),
//                     Container(
//                       height: 20,
//                       width: value * 3, // Adjust multiplier for width scaling
//                       color: rank == 1
//                           ? Colors.blue // Gold bar for first place
//                           : rank == 2
//                               ? Colors.lightBlue // Silver bar for second place
//                               : Colors.lightBlueAccent, // Bronze bar for third place
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(width: 10),
//               Text(player.score.toString()), // Display score
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
class AnimatedLeaderboard extends StatefulWidget {
  final List<Player> players;

  const AnimatedLeaderboard({super.key, required this.players});

  @override
  _AnimatedLeaderboardState createState() => _AnimatedLeaderboardState();
}

class _AnimatedLeaderboardState extends State<AnimatedLeaderboard> {
  @override
  Widget build(BuildContext context) {
    // Sort players by score in descending order
    List<Player> sortedPlayers = widget.players
      ..sort((a, b) => b.score.compareTo(a.score));

    // Top 3 players for the animated bars
    List<Player> topPlayers = sortedPlayers.take(3).toList();

    // Remaining players for the list beneath
    List<Player> remainingPlayers = sortedPlayers.skip(3).toList();

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
                                  mainAxisAlignment: MainAxisAlignment.start,

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
                      'Leaderboard',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
              


          // The top 3 animated bars
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (int i = 0; i < topPlayers.length; i++)
                _buildAnimatedBar(topPlayers[i], i + 1),
            ],
          ),
          const SizedBox(height: 20), // Space between bars and list
          // List of remaining ranked players with scores in gray squares
          _buildRankedList(remainingPlayers),
        ],
      ),
    
    ])
    );
  }

  Widget _buildAnimatedBar(Player player, int rank) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Player's name above the bar
        Text(
          "$rank.${player.name}",
          style: const TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        // Animated bar
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: player.score.toDouble()),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return Container(
              width: 40, // Width of the bar
              height: value * 3, // Height proportional to the score
              color: rank == 1
                  ? Colors.blue // Gold bar for first place
                  : rank == 2
                      ? Colors.lightBlue // Silver bar for second place
                      : Colors.lightBlueAccent, // Bronze bar for third place
            );
          },
        ),
        // Empty space with a transparent background
        Container(
          width: 40,
          height: 10, // Total height of the leaderboard, adjust as needed
          color: Colors.transparent,
        ),
      ],
    );
  }

  Widget _buildRankedList(List<Player> players) {
    return Container(color: Colors.grey[300],
      child: Column(
        children: players.map((player) {
          int rank = widget.players.indexOf(player) + 1; // Get rank from original list
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
             // Gray background
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$rank. ${player.name}', // Rank and name
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('${player.score} pts'), // Score
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}