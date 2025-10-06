
import 'package:flutter/material.dart';
import '../models/Square.dart';
import '../models/Board.dart';

class BoardWidget extends StatelessWidget {
  final Board board;

  const BoardWidget({Key? key, required this.board}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0, // ensures board is always square
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Board.size,
        ),
        itemCount: Board.size * Board.size,
        itemBuilder: (context, index) {
          final int row = index ~/ Board.size;
          final int col = index % Board.size;
          final Square square = board.grid[row][col];

          return Container(
            decoration: BoxDecoration(
              color: square.squareColor,
              border: Border.all(color: Colors.black12),
            ),
            child: Center(
              child: square.piece, // if null → shows empty square
            ),
          );
        },
      ),
    );
  }
}

