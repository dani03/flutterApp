import 'package:flutter/material.dart';

class TextContent extends StatelessWidget {
   const TextContent(this.outputText, {super.key});

  final String outputText;
  @override
  Widget build(context) {
    return Text(
      outputText,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
