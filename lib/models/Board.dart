import 'package:flutter/material.dart';
import 'Square.dart';
import 'Piece.dart';

class Board {
  static const int size = 8;
  late List<List<Square>> grid;

  Board() {
    grid = List.generate(size, (row) {
      return List.generate(size, (col) {
        final bool isDark = (row + col) % 2 == 1;
        return Square(
          row: row,
          column: col,
          squareColor: isDark ? Colors.brown : Colors.white,
        );
      });
    });

    _initializePieces();
  }

  void _initializePieces() {
    // Black pieces (top)
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < size; col++) {
        if ((row + col) % 2 == 1) {
          grid[row][col].placePiece(
            Piece(
              color: 'black',
              isKing: false,
              size: 40.0,
            ),
          );
        }
      }
    }

    // White pieces (bottom)
    for (int row = size - 3; row < size; row++) {
      for (int col = 0; col < size; col++) {
        if ((row + col) % 2 == 1) {
          grid[row][col].placePiece(
            Piece(
              color: 'white',
              isKing: false,
              size: 40.0,
            ),
          );
        }
      }
    }
  }

  Square getSquare(int row, int col) => grid[row][col];

  void movePiece(int fromRow, int fromCol, int toRow, int toCol) {
    final fromSquare = grid[fromRow][fromCol];
    final toSquare = grid[toRow][toCol];

    if (fromSquare.piece != null && toSquare.piece == null) {
      toSquare.placePiece(fromSquare.piece!);
      fromSquare.clearPiece();
    }
  }

}