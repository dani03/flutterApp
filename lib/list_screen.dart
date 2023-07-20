import 'package:firstapp/detail_screen.dart';
import 'package:firstapp/text_content.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  final String parameter;

  const ListScreen({required this.data, required this.parameter, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(parameter.toUpperCase()),
      ),
      body: ListView.builder(
        itemCount: data['results'].length,
        itemBuilder: (context, index) {
          var playerData = data['results'][index];
          var playerName = playerData['player_name'];
          var playerGames = playerData['games'];

          return GestureDetector(
            onTap: () {
              navigateToDetailScreen(context, playerName, playerGames);
            },
            child: ListTile(
              title: Text(playerName),
              subtitle: Text('Games: $playerGames'),
              selectedColor: const Color.fromARGB(255, 21, 92, 146),
              textColor: const Color.fromARGB(255, 12, 179, 40),
            ),
          );
        },
      ),
    );
  }
}

void navigateToDetailScreen(BuildContext context, String playerName, int playerGames) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailScreen(
        playerName: playerName,
      ),
    ),
  );
}
