import 'package:flutter/material.dart';
import '../models/Board.dart';
import '../widgets/board_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Board board = Board(); // initialize the board

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkers Game'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BoardWidget(board: board),
        ),
      ),
    );
  }
}
