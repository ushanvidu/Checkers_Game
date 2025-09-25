import 'package:flutter/material.dart'; // Import the material library

class Board extends StatefulWidget { // Added a name for your widget, e.g., "Board"
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState(); // Use the widget name for the State
}

class _BoardState extends State<Board> { // Use the widget name for the State
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Checkers Board'),
      ),
      body: Center(
        child: Text('Checkers Board UI', style: TextStyle(color: Colors.black),),
      ),
    ); // Placeholder for your widget's UI
  }
}
