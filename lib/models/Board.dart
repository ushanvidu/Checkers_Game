import 'package:flutter/material.dart';
import 'Square.dart';
import 'Piece.dart';
import 'dart:math';

class Board {
  static const int size = 8;
  late List<List<Square>> grid;

  // Track whose turn it is
  String turn = 'white';

  // Track captured pieces counts (optional UI feature)
  int whiteCaptured = 0;
  int blackCaptured = 0;

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
    // Black pieces (top) - rows 0, 1, 2
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < size; col++) {
        if ((row + col) % 2 == 1) {
          grid[row][col].placePiece(
            Piece(color: 'black', isKing: false),
          );
        }
      }
    }

    // White pieces (bottom) - rows 5, 6, 7
    for (int row = size - 3; row < size; row++) {
      for (int col = 0; col < size; col++) {
        if ((row + col) % 2 == 1) {
          grid[row][col].placePiece(
            Piece(color: 'white', isKing: false),
          );
        }
      }
    }
  }

  // --- GAME LOGIC ---

  // Attempt to make a move. Returns true if the move was successful.
  bool makeMove(int fromRow, int fromCol, int toRow, int toCol) {
    final fromSquare = grid[fromRow][fromCol];
    final toSquare = grid[toRow][toCol];
    final piece = fromSquare.piece;

    // 1. Basic Validation checks
    if (piece == null || piece.color != turn) return false; // Not your turn or empty
    if (toSquare.piece != null) return false; // Destination occupied
    if (toSquare.squareColor == Colors.white) return false; // Cannot move to white square

    int rowDiff = toRow - fromRow;
    int colDiff = toCol - fromCol;

    // 2. Validate Direction
    // White moves UP (negative rowDiff), Black moves DOWN (positive rowDiff)
    bool isForward = (piece.color == 'white' && rowDiff < 0) ||
        (piece.color == 'black' && rowDiff > 0);

    // Kings can move in any direction
    if (!piece.isKing && !isForward) return false;

    // 3. Move Logic

    // Simple Move (1 step diagonal)
    if (rowDiff.abs() == 1 && colDiff.abs() == 1) {
      _movePieceInternal(fromSquare, toSquare, piece);
      _endTurn();
      return true;
    }

    // Capture Move (2 steps diagonal)
    if (rowDiff.abs() == 2 && colDiff.abs() == 2) {
      // Find the middle square (the one being jumped over)
      int midRow = (fromRow + toRow) ~/ 2;
      int midCol = (fromCol + toCol) ~/ 2;
      final midSquare = grid[midRow][midCol];

      // Check if there is an opponent piece to capture
      if (midSquare.piece != null && midSquare.piece!.color != piece.color) {
        _movePieceInternal(fromSquare, toSquare, piece);
        midSquare.clearPiece(); // Remove captured piece

        // Update stats
        if (piece.color == 'white') blackCaptured++; else whiteCaptured++;

        // Note: Standard rules often allow double jumps here.
        // For simplicity, we just end the turn after one jump.
        _endTurn();
        return true;
      }
    }

    return false;
  }

  void _movePieceInternal(Square from, Square to, Piece piece) {
    from.clearPiece();

    // Check for Promotion
    bool promote = false;
    if (piece.color == 'white' && to.row == 0) promote = true;
    if (piece.color == 'black' && to.row == size - 1) promote = true;

    if (promote) {
      to.placePiece(Piece(color: piece.color, isKing: true));
    } else {
      to.placePiece(piece);
    }
  }

  void _endTurn() {
    turn = (turn == 'white') ? 'black' : 'white';
  }
}