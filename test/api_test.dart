
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

void main() {
  test('Test API', () async {
    const apiUrl =
        'https://nba-stats-db.herokuapp.com/api/playerdata/topscorers/total/season/2023/';
    final response = await http.get(Uri.parse(apiUrl));

    // Check if the API request was successful (status code 200)
    expect(response.statusCode, 200);

    // Parse the JSON response
    final jsonData = response.body;
    final parsedData = json.decode(jsonData);

    // Check if the response contains data
    expect(parsedData, isNotEmpty);

    // Check if the response is in the expected JSON format
    final expectedKeys = [
      'id',
      'player_name',
      'age',
      'games',
      'games_started',
      'minutes_played',
      'field_goals',
      'field_attempts',
      'field_percent',
      'three_fg',
      'three_attempts',
      'three_percent',
      'two_fg',
      'two_attempts',
      'two_percent',
      'effect_fg_percent',
      'ft',
      'fta',
      'ft_percent',
      'ORB',
      'DRB',
      'TRB',
      'AST',
      'STL',
      'BLK',
      'TOV',
      'PF',
      'PTS',
      'team',
      'season',
    ];

    for (var playerData in parsedData['results']) {
      expect(playerData.keys, containsAll(expectedKeys));
    }
  });
}
