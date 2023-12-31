import 'package:firstapp/button_widget.dart';
//import 'package:firstapp/text_content.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firstapp/list_screen.dart';

const startAligment = Alignment.topLeft;
AlignmentGeometry endAligment = Alignment.bottomRight;

class GradientContainer extends StatefulWidget {
  final Color color1;
  final Color color2;

  const GradientContainer(
    this.color1,
    this.color2, {
    super.key,
  });

  @override
  State<GradientContainer> createState() {
    return _GradientContainerState();
  }
}

class _GradientContainerState extends State<GradientContainer> {
  Map<String, dynamic> apiData = {};

  @override
  void initState() {
    super.initState();

    fetchData(
        'https://nba-stats-db.herokuapp.com/api/playerdata/topscorers/total/season/2023/');
  }

  Future<void> fetchData(String endpoint) async {
    try {
      var response = await http.get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          apiData = data;
        });
      } else {
        // print('erreur dans le code: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [widget.color1, widget.color2],
          begin: startAligment,
          end: endAligment,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/basketball.jpg', width: 200),
            const SizedBox(height: 20),
            ButtonWidget(
              'scorers',
              onPressed: () {
                fetchData(
                    'https://nba-stats-db.herokuapp.com/api/playerdata/topscorers/total/season/2023/');
                navigateToListScreen(context, 'scorers');
              },
            ),
            const SizedBox(height: 20),
            ButtonWidget(
              'Passeurs',
              onPressed: () {
                fetchData(
                    'https://nba-stats-db.herokuapp.com/api/top_assists/totals/2023/');
                navigateToListScreen(context, 'passeurs');
              },
            ),
            const SizedBox(height: 20),
            ButtonWidget(
              'rebonds',
              onPressed: () {
                fetchData(
                    'https://nba-stats-db.herokuapp.com/api/top_rebounds/totals/2023/');
                navigateToListScreen(context, 'rebonds');
              },
            ),
          ],
        ),
      ),
    );
  }

  void navigateToListScreen(BuildContext context, String dataParameter) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListScreen(
          data: apiData,
          parameter: dataParameter,
        ),
      ),
    );
  }
}
