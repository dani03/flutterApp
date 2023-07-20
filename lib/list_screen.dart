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
          
          
          return ListTile(
            title: Text(playerName),
          
          );
        },
      ),
    );
  }
}
