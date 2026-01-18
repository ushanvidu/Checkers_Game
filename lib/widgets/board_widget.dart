import 'package:flutter/material.dart';
import 'dart:math'; // Required for min()
import '../models/Board.dart';
import '../models/Square.dart';

class BoardWidget extends StatefulWidget {
  final Board board;

  const BoardWidget({Key? key, required this.board}) : super(key: key);

  @override
  State<BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  Square? selectedSquare; // Stores the "From" square

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the maximum square size that fits in the available space.
        // We subtract 60 pixels from the height to save room for the "Turn" text.
        final double availableWidth = constraints.maxWidth;
        final double availableHeight = constraints.maxHeight;

        // This ensures the board fits whether you are in Portrait or Landscape
        double boardSize = min(availableWidth, availableHeight - 60);
        if (boardSize < 0) boardSize = 0; // Safety check

        return Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            // Turn Indicator
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Turn: ${widget.board.turn.toUpperCase()}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: widget.board.turn == 'white' ? Colors.red : Colors.black
                ),
              ),
            ),

            // The Board Grid constrained to boardSize
            SizedBox(
              width: boardSize,
              height: boardSize,
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

                  // Highlight logic
                  bool isSelected = selectedSquare == square;

                  return GestureDetector(
                    onTap: () => _handleTap(square),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _getSquareColor(square, isSelected),
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: Center(
                        child: square.piece,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Color _getSquareColor(Square square, bool isSelected) {
    if (isSelected) {
      return Colors.greenAccent.withOpacity(0.7); // Highlight selected
    }
    return square.squareColor;
  }

  void _handleTap(Square tappedSquare) {
    setState(() {
      // 1. If nothing is selected, try to select a piece
      if (selectedSquare == null) {
        if (tappedSquare.piece != null && tappedSquare.piece!.color == widget.board.turn) {
          selectedSquare = tappedSquare;
        }
      }
      // 2. If a piece is already selected...
      else {
        // If tapping the same square, deselect it
        if (selectedSquare == tappedSquare) {
          selectedSquare = null;
        }
        // If tapping another piece of OWN color, switch selection
        else if (tappedSquare.piece != null && tappedSquare.piece!.color == widget.board.turn) {
          selectedSquare = tappedSquare;
        }
        // 3. Attempt to Move to empty square
        else {
          bool success = widget.board.makeMove(
              selectedSquare!.row,
              selectedSquare!.column,
              tappedSquare.row,
              tappedSquare.column
          );

          if (success) {
            selectedSquare = null; // Move complete, deselect
          } else {
            // Optional: Show "Invalid Move" snackbar
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Invalid Move!"),
                    duration: Duration(milliseconds: 500)
                )
            );
          }
        }
      }
    });
  }
}