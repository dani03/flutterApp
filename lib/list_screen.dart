import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<dynamic> data;
  final String parameter;

  const ListScreen({required this.data, required this.parameter, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(parameter.toUpperCase()),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          var item = data[index];
          return ListTile(
            title: Text(item['title'] ? 'oui': 'non il y a pas de titre'),
            subtitle: Text(item['description'] ? 'oui' : 'non il y a pas de sous titre'),
          );
        },
      ),
    );
  }
}
