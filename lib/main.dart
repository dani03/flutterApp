import 'package:firstapp/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        //backgroundColor: Color.fromARGB(255, 105, 224, 188),
        body: GradientContainer(Color.fromARGB(255, 241, 245, 244),
            Color.fromARGB(255, 40, 169, 130)),
      ),
    ),
  );
}
