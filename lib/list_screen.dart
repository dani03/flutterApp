import 'package:firstapp/detail_screen.dart';

import 'package:flutter/material.dart';
import 'dart:convert';

// -- coding: utf-8 --
class ListScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  final String parameter;
  final Utf8Encoder utf8Encoder = const Utf8Encoder();

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
          playerName = replaceString(playerName);

          // List<int> encodedBytes = utf8.encode(playerName);
          // playerName = utf8.decode(encodedBytes);

          var playerGames = playerData['games'];
          var playerAge = playerData['age'];
          var playerTeam = playerData['team'];

          return GestureDetector(
            onTap: () {
              navigateToDetailScreen(context, playerName, playerGames);
            },
            child: ListTile(
              title: Text(
                playerName,
                style: const TextStyle(
                  fontSize: 23,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'équipe : $playerTeam, age:  $playerAge ans.',
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
          );
        },
      ),
    );
  }
}

String replaceString(text) {
  const caracterToChange = 'ÄiÄ';
  const caracterToAdd = 'ć';
  return text.replaceAll(caracterToChange, caracterToAdd);
}

void navigateToDetailScreen(
    BuildContext context, String playerName, int playerGames) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailScreen(
        playerName: playerName,
      ),
    ),
  );
}
