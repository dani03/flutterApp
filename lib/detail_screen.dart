import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.playerName});
  final String playerName;
  @override
  State<DetailScreen> createState() {
    return _DetailScreenState();
  }
}

class _DetailScreenState extends State<DetailScreen> {
  List<dynamic>? playerStats;
  int season = 2023;

  @override
  void initState() {
    super.initState();
    // Fetch les datas de l'utilisateurs
    fetchStats(widget.playerName);
  }

  void fetchStats(String nom) async {
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://nba-stats-db.herokuapp.com/api/playerdata/name/$nom'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        processData(await response.stream.bytesToString());
      } else {
        print(
            "Erreur lors de l'appel à l'API: ${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Une erreur inattendue s'est produite: $e");
    }
  }

  void processData(String jsonString) {
    setState(() {
      Map<String, dynamic> data = json.decode(jsonString);
      playerStats = data['results'];
      print(' resluts here: $playerStats');
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('hello player stats--------------> : $playerStats');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.playerName),
      ),
      body: Align(
          alignment: Alignment.topCenter,
          child: playerStats != null
              ? ListView(
                  children: [
                    // Display other player stats using playerStats

                    for (var playerSeason in playerStats!)
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  season = playerSeason['season'];
                                });
                              },
                              child: Text(
                                playerSeason['season'].toString(),
                                style: const TextStyle(fontSize: 28),
                              )),
                          if (season == playerSeason['season'])
                            Column(
                              children: [
                                Text(
                                  '${playerSeason['games'].toString()} matches',
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  'équipe: ${playerSeason['team'].toString()}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  'matches débutés: ${playerSeason['games_started'].toString()}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  'Nombre de panier: ${playerSeason['field_goals'].toString()}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  'Nombre de points: ${playerSeason['PTS'].toString()}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                        ],
                      )
                  ],
                )
              : const CircularProgressIndicator()),
    );
  }
}
