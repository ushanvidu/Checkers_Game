import 'package:flutter/material.dart';
import '../models/Board.dart';
import '../models/Square.dart';

class BoardWidget extends StatefulWidget {
  final Board board;

  const BoardWidget({Key? key, required this.board}) : super(key: key);

  @override
  State<BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  Square? selectedSquare; // currently selected square

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Board.size,
        ),
        itemCount: Board.size * Board.size,
        itemBuilder: (context, index) {
          final int row = index ~/ Board.size;
          final int col = index % Board.size;
          final Square square = widget.board.grid[row][col];

          // Check if this is the selected square
          bool isSelected = selectedSquare == square;

          return GestureDetector(
            onTap: () => _onSquareTap(square),
            child: Container(
              decoration: BoxDecoration(
                color: _getSquareColor(square, isSelected),
                border: Border.all(color: Colors.red, width: 2.0),
              ),
              child: Center(
                child: square.piece,
              ),
            ),
          );
        },
      ),
    );
  }

  // Highlight selected square
  Color _getSquareColor(Square square, bool isSelected) {
    if (isSelected) {
      return Colors.yellowAccent.withOpacity(0.5);
    }
    return square.squareColor;
  }

  void _onSquareTap(Square square) {
    setState(() {
      // if already selected → deselect
      if (selectedSquare == square) {
        selectedSquare = null;
      } else {
        selectedSquare = square;
      }
    });
    debugPrint('Selected Square: Row ${square.row}, Column ${square.column}');
  }
}